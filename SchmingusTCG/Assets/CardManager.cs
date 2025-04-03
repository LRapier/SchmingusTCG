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
    Action<string> _pullCardCallback;
    public GameObject inventoryParent;
    public GameObject storeUI;
    public GameObject okButton;
    GameObject animatedPulledCard;
    public Sprite holoSprite;
    public Sprite foilSprite;

    void Start()
    {
        _createCardsCallback = (jsonArrayString) =>
        {
            StartCoroutine(CreateCardsRoutine(jsonArrayString));
        };
        _pullCardCallback = (jsonArrayString) =>
        {
            StartCoroutine(PullCardRoutine(jsonArrayString));
        };

        CreateCards();
    }

    public void ResetPull()
    {
        Destroy(animatedPulledCard);
        okButton.SetActive(false);
    }

    public void CreateCards()
    {
        string userId = Main.Instance.userInfo.UserID;
        StartCoroutine(Main.Instance.web.GetCardsIDs(userId, _createCardsCallback));
    }

    public void AddCard()
    {
        if (int.Parse(Main.Instance.userInfo.Money) >= 49)
        {
            string userId = Main.Instance.userInfo.UserID;
            StartCoroutine(Main.Instance.web.PullCard(userId, _pullCardCallback));
        }
    }

    IEnumerator CreateCardsRoutine(string jsonArrayString)
    {
        JSONArray jsonArray = JSON.Parse(jsonArrayString) as JSONArray;
        if (jsonArray != null)
        {
            for (int i = 0; i < jsonArray.Count; i++)
            {
                bool isDone = false;
                string cardId = jsonArray[i].AsObject["cardid"];
                string id = jsonArray[i].AsObject["id"];
                string edition = jsonArray[i].AsObject["edition"];
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
                cardGO.transform.SetParent(inventoryParent.transform);
                cardGO.transform.localScale = Vector3.one;
                cardGO.transform.localPosition = Vector3.zero;

                cardGO.transform.Find("Name").GetComponent<TextMeshProUGUI>().text = cardInfoJson["name"];
                int price = cardInfoJson["price"];
                if(edition == "holo")
                {
                    price = (int)(price * 2);
                }
                else if(edition == "foil")
                {
                    price = (int)(price * 1.25);
                }
                cardGO.transform.Find("Price").GetComponent<TextMeshProUGUI>().text = cardInfoJson["price"] + " Smackers";
                cardGO.transform.Find("Description").GetComponent<TextMeshProUGUI>().text = cardInfoJson["description"];
                string rarity = cardInfoJson["rarity"];
                cardGO.transform.Find("Rarity").GetComponent<TextMeshProUGUI>().text = char.ToUpper(rarity[0]) + rarity.Substring(1);
                switch(edition)
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

    IEnumerator PullCardRoutine(string jsonArrayString)
    {
        //Add to Inventory
        JSONArray jsonArray = JSON.Parse(jsonArrayString) as JSONArray;

        for (int i = 0; i < jsonArray.Count; i++)
        {
            bool isDone = false;
            string cardId = jsonArray[i].AsObject["cardid"];
            string id = jsonArray[i].AsObject["id"];
            string edition = jsonArray[i].AsObject["edition"];
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
            cardGO.transform.SetParent(inventoryParent.transform);
            cardGO.transform.localScale = Vector3.one;
            cardGO.transform.localPosition = Vector3.zero;

            cardGO.transform.Find("Name").GetComponent<TextMeshProUGUI>().text = cardInfoJson["name"];
            cardGO.transform.Find("Price").GetComponent<TextMeshProUGUI>().text = cardInfoJson["price"] + " Smackers";
            cardGO.transform.Find("Description").GetComponent<TextMeshProUGUI>().text = cardInfoJson["description"];
            string rarity = cardInfoJson["rarity"];
            cardGO.transform.Find("Rarity").GetComponent<TextMeshProUGUI>().text = char.ToUpper(rarity[0]) + rarity.Substring(1);
            switch(edition)
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


            cardGO.transform.Find("Sell").GetComponent<Button>().onClick.AddListener(() =>
            {
                string idInInventory = id;
                string iId = cardId;
                string userId = Main.Instance.userInfo.UserID;

                StartCoroutine(Main.Instance.web.SellCard(idInInventory, userId, iId));
                cardGO.GetComponentInParent<SellDelete>().Sell();
            });

        }

        //Play Animation
        jsonArray = JSON.Parse(jsonArrayString) as JSONArray;

        for (int i = 0; i < jsonArray.Count; i++)
        {
            bool isDone = false;
            string cardId = jsonArray[i].AsObject["cardid"];
            string id = jsonArray[i].AsObject["id"];
            string edition = jsonArray[i].AsObject["edition"];
            JSONObject cardInfoJson = new JSONObject();

            Action<string> getCardInfoCallback = (cardInfo) =>
            {
                isDone = true;
                JSONArray tempArray = JSON.Parse(cardInfo) as JSONArray;
                cardInfoJson = tempArray[0].AsObject;
            };

            StartCoroutine(Main.Instance.web.GetCards(cardId, getCardInfoCallback));

            yield return new WaitUntil(() => isDone == true);

            GameObject cardGO = Instantiate(Resources.Load("Prefabs/Card Animation") as GameObject);
            animatedPulledCard = cardGO;
            Card card = cardGO.AddComponent<Card>();
            card.ID = id;
            card.cardID = cardId;
            cardGO.transform.SetParent(storeUI.transform);
            cardGO.transform.localScale = Vector3.one;
            cardGO.transform.localPosition = Vector3.zero;

            cardGO.transform.Find("Name").GetComponent<TextMeshProUGUI>().text = cardInfoJson["name"];
            cardGO.transform.Find("Price").GetComponent<TextMeshProUGUI>().text = cardInfoJson["price"] + " Smackers";
            cardGO.transform.Find("Description").GetComponent<TextMeshProUGUI>().text = cardInfoJson["description"];
            string rarity = cardInfoJson["rarity"];
            cardGO.transform.Find("Rarity").GetComponent<TextMeshProUGUI>().text = char.ToUpper(rarity[0]) + rarity.Substring(1);
            switch(edition)
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
        okButton.SetActive(true);
        StartCoroutine(Main.Instance.web.GetMoney());
    }
}
