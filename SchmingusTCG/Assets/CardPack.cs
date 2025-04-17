using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CardPack : MonoBehaviour
{
    public string cardPackName;
    public int cost;

    public void BuyPack()
    {
        if(cost <= int.Parse(Main.Instance.userInfo.Money))
        {
            CardManager.Instance.AddCard(cardPackName, cost, 1);
            StartCoroutine(Main.Instance.web.GetMoney());
        }
    }
}
