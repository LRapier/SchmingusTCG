using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using SimpleJSON;
using TMPro;
using UnityEngine.XR;
using static UnityEditor.Progress;

public class CardManager : MonoBehaviour
{
    Action<string> _createCardsCallback;

    void Start()
    {
        _createCardsCallback = (jsonArrayString) =>
        {
            StartCoroutine(CreateCardsRoutine(jsonArrayString));
        };

        CreateCards();
    }

    public void CreateCards()
    {
        string userId = Main.Instance.userInfo.UserID;
        StartCoroutine(Main.Instance.web.GetCardsIDs(userId, _createCardsCallback));
    }

    IEnumerator CreateCardsRoutine(string jsonArrayString)
    {
        JSONArray jsonArray = JSON.Parse(jsonArrayString) as JSONArray;

        for (int i = 0; i < jsonArray.Count; i++)
        {
            bool isDone = false;
            string cardId = jsonArray[i].AsObject["cardid"];
            string id = jsonArray[i].AsObject["id"];
            JSONObject cardInfoJson = new JSONObject();

            Action<string> getCardInfoCallback = (cardInfo) =>
            {
                isDone = true;
                JSONArray tempArray = JSON.Parse(cardInfo) as JSONArray;
                cardInfoJson = tempArray[0].AsObject;
            };

            StartCoroutine(Main.Instance.web.GetCards(cardId, getCardInfoCallback));

            yield return new WaitUntil(() => isDone == true);

            GameObject cardGO = Instantiate(Resources.Load("Prefabs/Card") as GameObject);
            Card card = cardGO.AddComponent<Card>();
            card.ID = id;
            card.cardID = cardId;
            cardGO.transform.SetParent(this.transform);
            cardGO.transform.localScale = Vector3.one;
            cardGO.transform.localPosition = Vector3.zero;

            cardGO.transform.Find("Name").GetComponent<TextMeshProUGUI>().text = cardInfoJson["name"];
            cardGO.transform.Find("Price").GetComponent<TextMeshProUGUI>().text = cardInfoJson["price"] + " Smackers";
            cardGO.transform.Find("Description").GetComponent<TextMeshProUGUI>().text = cardInfoJson["description"];

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


            cardGO.transform.Find("Sell").GetComponent<Button>().onClick.AddListener(() =>
            {
                string idInInventory = id;
                string iId = cardId;
                string userId = Main.Instance.userInfo.UserID;

                StartCoroutine(Main.Instance.web.SellCard(idInInventory, userId, iId));
                cardGO.GetComponentInParent<SellDelete>().Sell();
            });

        }
    }
}
