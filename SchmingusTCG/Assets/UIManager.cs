using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class UIManager : MonoBehaviour
{
    public GameObject inventoryUI, tradeUI, coalUI, storeUI;
    public Button inventoryButton, tradeButton, coalButton, storeButton;

    public void OpenInventory()
    {
        tradeUI.SetActive(false);
        coalUI.SetActive(false);
        inventoryUI.SetActive(true);
        storeUI.SetActive(false);

        tradeButton.interactable = true;
        coalButton.interactable = true;
        inventoryButton.interactable = false;
        storeButton.interactable = true;

        tradeButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        coalButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        inventoryButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, .5f);
        storeButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
    }

    public void OpenCoal()
    {
        tradeUI.SetActive(false);
        coalUI.SetActive(true);
        inventoryUI.SetActive(false);
        storeUI.SetActive(false);

        tradeButton.interactable = true;
        coalButton.interactable = false;
        inventoryButton.interactable = true;
        storeButton.interactable = true;

        tradeButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        coalButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, .5f);
        inventoryButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        storeButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
    }

    public void OpenTrade()
    {
        tradeUI.SetActive(true);
        coalUI.SetActive(false);
        inventoryUI.SetActive(false);
        storeUI.SetActive(false);

        tradeButton.interactable = false;
        coalButton.interactable = true;
        inventoryButton.interactable = true;
        storeButton.interactable = true;

        tradeButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, .5f);
        coalButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        inventoryButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        storeButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
    }

    public void OpenStore()
    {
        tradeUI.SetActive(false);
        coalUI.SetActive(false);
        inventoryUI.SetActive(false);
        storeUI.SetActive(true);

        tradeButton.interactable = true;
        coalButton.interactable = true;
        inventoryButton.interactable = true;
        storeButton.interactable = false;

        tradeButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        coalButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        inventoryButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, 1);
        storeButton.GetComponentInChildren<TextMeshProUGUI>().color = new Color(1, 1, 1, .5f);
    }
}
