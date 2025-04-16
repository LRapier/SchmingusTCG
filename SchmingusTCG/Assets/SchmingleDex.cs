using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using SimpleJSON;
using TMPro;
using UnityEngine.XR;
using static UnityEditor.Progress;

public class SchmingleDex : MonoBehaviour
{
    Action<string> _createDexCallback;
    Action<string> _discoveredFlag;
    public GameObject inventoryParent;
    public int isDiscovered = 0;
    bool isDone1;
    bool isDone2;
    bool normalDone = false;
    bool foilDone = false;
    bool holoDone = false;
    public bool start = false;
    public Sprite holoSprite;
    public Sprite foilSprite;

    public void OnEnable()
    {
        foreach(DexCard card in inventoryParent.GetComponentsInChildren<DexCard>())
        {
            Destroy(card.gameObject);
        }
        _createDexCallback = (jsonArrayString) =>
        {
            StartCoroutine(CreateDexRoutine(jsonArrayString));
        };
        _discoveredFlag = (discovered) =>
        {
            isDone2 = true;
            isDiscovered = int.Parse(discovered);
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
                StartCoroutine(MakeDexEntry(jsonArray, i, "none"));
                yield return new WaitUntil(() => normalDone);
                StartCoroutine(MakeDexEntry(jsonArray, i, "foil"));
                yield return new WaitUntil(() => foilDone);
                StartCoroutine(MakeDexEntry(jsonArray, i, "holo"));
                yield return new WaitUntil(() => holoDone);
                normalDone = false;
                foilDone = false;
                holoDone = false;
            }
        }
    }
    IEnumerator MakeDexEntry(JSONArray jsonArray, int x, string edition)
    {
        isDone1 = false;
        isDone2 = false;
        string cardId = jsonArray[x].AsObject["id"];
        JSONObject cardInfoJson = new JSONObject();

        Action<string> getCardInfoCallback = (cardInfo) =>
        {
            isDone1 = true;
            JSONArray tempArray = JSON.Parse(cardInfo) as JSONArray;
            cardInfoJson = tempArray[0].AsObject;
        };

        StartCoroutine(Main.Instance.web.GetCards(cardId, getCardInfoCallback));

        yield return new WaitUntil(() => isDone1);

        StartCoroutine(Main.Instance.web.IsCardInInventory(cardId, Main.Instance.userInfo.UserID, edition, _discoveredFlag));

        yield return new WaitUntil(() => isDone2);

        GameObject cardGO = Instantiate(Resources.Load("Prefabs/Card Dex") as GameObject);
        Card card = cardGO.AddComponent<Card>();
        card.cardID = cardId;
        cardGO.transform.SetParent(inventoryParent.transform);
        cardGO.transform.localScale = Vector3.one;
        cardGO.transform.localPosition = Vector3.zero;

        if (isDiscovered >= 1)
        {
            cardGO.transform.Find("Name").GetComponent<TextMeshProUGUI>().text = cardInfoJson["name"];
            switch (edition)
            {
                case "holo":
                    cardGO.transform.Find("Price").GetComponent<TextMeshProUGUI>().text = (int.Parse(cardInfoJson["price"]) * 2) + " Smackers";
                    break;
                case "foil":
                    cardGO.transform.Find("Price").GetComponent<TextMeshProUGUI>().text = ((int)(int.Parse(cardInfoJson["price"]) * 1.25)) + " Smackers";
                    break;
                case "none":
                    cardGO.transform.Find("Price").GetComponent<TextMeshProUGUI>().text = cardInfoJson["price"] + " Smackers";
                    break;
            }
            cardGO.transform.Find("Description").GetComponent<TextMeshProUGUI>().text = cardInfoJson["description"];
            string rarity = cardInfoJson["rarity"];
            cardGO.transform.Find("Rarity").GetComponent<TextMeshProUGUI>().text = char.ToUpper(rarity[0]) + rarity.Substring(1);
            switch (edition)
            {
                case "holo":
                    cardGO.transform.Find("Edition").GetComponent<Image>().sprite = holoSprite;
                    break;
                case "foil":
                    cardGO.transform.Find("Edition").GetComponent<Image>().sprite = foilSprite;
                    break;
                case "none":
                    cardGO.transform.Find("Edition").GetComponent<Image>().color = new Color(1f, 1f, 1f, 0f);
                    break;
            }

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
        switch (edition)
        {
            case "holo":
                holoDone = true;
                break;
            case "foil":
                foilDone = true;
                break;
            case "none":
                normalDone = true;
                break;
        }
    }
}
