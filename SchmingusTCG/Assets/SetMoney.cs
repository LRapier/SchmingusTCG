using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class SetMoney : MonoBehaviour
{
    void OnEnable()
    {
        UpdateMoney();
    }

    public void UpdateMoney()
    {
        GetComponent<TextMeshProUGUI>().text = Main.Instance.userInfo.Money + " Smackers";
    }
}
