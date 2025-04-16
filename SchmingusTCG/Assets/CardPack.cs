using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CardPack : MonoBehaviour
{
    public string cardPackName;
    public int cost;

    public void BuyPack()
    {
        CardManager.Instance.AddCard(cardPackName, cost, 1);
    }
}
