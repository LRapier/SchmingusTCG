using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Mine : MonoBehaviour
{
    public GameObject coal;
    public void MineMoney()
    {
        StartCoroutine(Main.Instance.web.MineMoney(1));
        GameObject newCoal = Instantiate(coal);
        newCoal.transform.SetParent(transform, false);
        StartCoroutine(ClearCoal(newCoal));
    }

    public IEnumerator ClearCoal(GameObject coal)
    {
        yield return new WaitForSeconds(1f);
        Destroy(coal);
    }
}
