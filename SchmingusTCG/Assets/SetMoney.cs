using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class SetMoney : MonoBehaviour
{
    void OnEnable()
    {
        bool isSelling = false;
        UpdateMoney(isSelling);
    }

    public void UpdateMoney(bool isSelling)
    {
        GetComponent<TextMeshProUGUI>().text = Main.Instance.userInfo.Money + " Smackers";
    }
}
