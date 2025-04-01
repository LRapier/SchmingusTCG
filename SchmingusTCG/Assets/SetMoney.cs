using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class SetMoney : MonoBehaviour
{
    bool isLoaded = false;
    void OnEnable()
    {
        bool isSelling = false;
        UpdateMoney(isSelling);
    }

    public void UpdateMoney(bool isSelling)
    {
        if(isLoaded && !isSelling)
            GetComponent<TextMeshProUGUI>().text = (int.Parse(Main.Instance.userInfo.Money) + 1) + " Smackers";
        else
        {
            GetComponent<TextMeshProUGUI>().text = Main.Instance.userInfo.Money + " Smackers";
            isLoaded = true;
        }

    }
}
