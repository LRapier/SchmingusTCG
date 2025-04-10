using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using SimpleJSON;
using TMPro;
using UnityEngine.XR;
using static UnityEditor.Progress;
using System.Diagnostics;

public class SchmingleDex : MonoBehaviour
{
    Action<string> _createDexCallback;
    Action<string> _discoveredFlag;
    public GameObject inventoryParent;
    public int isDiscovered;
    bool isDone;
    public bool start = false;

    void Start()
    {
        _createDexCallback = (jsonArrayString) =>
        {
            StartCoroutine(CreateDexRoutine(jsonArrayString));
        };
        _discoveredFlag = (discovered) =>
        {
            isDiscovered = int.Parse(discovered);
            isDone = true;
        };

        CreateDex();
    }

    public void CreateDex()
    {
        StartCoroutine(Main.Instance.web.GetAllCards(_createDexCallback));
    }

    IEnumerator CreateDexRoutine(string jsonArrayString)
    {
        JSONArray jsonArray = JSON.Parse(jsonArrayString) as JSONArray;
        if (jsonArray != null)
        {
            for (int i = 0; i < jsonArray.Count; i++)
            {
                isDone = false;
                string cardId = jsonArray[i].AsObject["id"];
                JSONObject cardInfoJson = new JSONObject();

                Action<string> getCardInfoCallback = (cardInfo) =>
                {
                    JSONArray tempArray = JSON.Parse(cardInfo) as JSONArray;
                    cardInfoJson = tempArray[0].AsObject;
                };

                StartCoroutine(Main.Instance.web.GetCards(cardId, getCardInfoCallback));
                StartCoroutine(Main.Instance.web.IsCardInInventory(cardId, Main.Instance.userInfo.UserID, _discoveredFlag));

                yield return new WaitUntil(() => isDone == true);

                GameObject cardGO = Instantiate(Resources.Load("Prefabs/Card Dex") as GameObject);
                Card card = cardGO.AddComponent<Card>();
                card.cardID = cardId;
                cardGO.transform.SetParent(inventoryParent.transform);
                cardGO.transform.localScale = Vector3.one;
                cardGO.transform.localPosition = Vector3.zero;

                if (isDiscovered == 1)
                {
                    cardGO.transform.Find("Name").GetComponent<TextMeshProUGUI>().text = cardInfoJson["name"];
                    cardGO.transform.Find("Price").GetComponent<TextMeshProUGUI>().text = cardInfoJson["price"] + " Smackers";
                    cardGO.transform.Find("Description").GetComponent<TextMeshProUGUI>().text = cardInfoJson["description"];
                    string rarity = cardInfoJson["rarity"];
                    cardGO.transform.Find("Rarity").GetComponent<TextMeshProUGUI>().text = char.ToUpper(rarity[0]) + rarity.Substring(1);
                    cardGO.transform.Find("Edition").GetComponent<Image>().color = new Color(1f, 1f, 1f, 0f);

                    int imgVer = cardInfoJson["imgVer"].AsInt;

                    byte[] bytes = ImageManager.Instance.LoadImage(cardId, imgVer);

                    if (bytes.Length == 0)
                    {
                        Action<byte[]> getCardIconCallback = (downloadedBytes) =>
                        {
                            Sprite sprite = ImageManager.Instance.BytesToSprite(downloadedBytes);
                            cardGO.transform.Find("Image").GetComponent<Image>().sprite = sprite;
                            ImageManager.Instance.SaveImage(cardId, downloadedBytes, imgVer);
                            ImageManager.Instance.SaveVersionJson();
                        };
                        StartCoroutine(Main.Instance.web.GetCardIcon(cardId, getCardIconCallback));
                    }
                    else
                    {
                        Sprite sprite = ImageManager.Instance.BytesToSprite(bytes);
                        cardGO.transform.Find("Image").GetComponent<Image>().sprite = sprite;
                    }
                }
                isDiscovered = 0;
            }
        }
    }
}
