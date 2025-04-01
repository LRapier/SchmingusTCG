using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEditor.Progress;

public class SellDelete : MonoBehaviour
{
    public void Sell()
    {
        StartCoroutine(Main.Instance.web.GetMoney(this));
    }

    public void DeleteCard()
    {
        Destroy(gameObject);
    }
}
