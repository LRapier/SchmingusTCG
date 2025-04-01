using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class Web : MonoBehaviour
{
    void Start()
    {
        StartCoroutine(GetDate());
    }

    public IEnumerator GetDate()
    {
        using (UnityWebRequest www = UnityWebRequest.Get("http://localhost/SchmingusTCG/GetDate.php"))
        {
            yield return www.SendWebRequest();
            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                // Show results as text
                Debug.Log(www.downloadHandler.text);
            }
        }
    }

    public IEnumerator Login(string username, string password)
    {
        WWWForm form = new WWWForm();
        form.AddField("loginUser", username);
        form.AddField("loginPass", password);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/SchmingusTCG/Login.php", form))
        {
            yield return www.SendWebRequest();
            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                Debug.Log(www.downloadHandler.text);
                Main.Instance.userInfo.SetCredentials(username, password);
                Main.Instance.userInfo.SetInfo(www.downloadHandler.text);

                if (www.downloadHandler.text.Contains("Wrong Credentials") || www.downloadHandler.text.Contains("Username does not exist"))
                    Debug.Log("Try Again");
                else
                {
                    Main.Instance.userProfile.SetActive(true);
                    Main.Instance.login.gameObject.SetActive(false);
                }
            }
        }
    }

    public IEnumerator RegisterUser(string username, string password)
    {
        WWWForm form = new WWWForm();
        form.AddField("loginUser", username);
        form.AddField("loginPass", password);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/SchmingusTCG/RegisterUser.php", form))
        {
            yield return www.SendWebRequest();

            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                Debug.Log(www.downloadHandler.text);
            }
        }
    }

    public IEnumerator GetCardsIDs(string userID, System.Action<string> callback)
    {
        WWWForm form = new WWWForm();
        form.AddField("userID", userID);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/SchmingusTCG/GetCardsIDs.php", form))
        {
            yield return www.SendWebRequest();

            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                // Show results as text
                Debug.Log(www.downloadHandler.text);
                string jsonArray = www.downloadHandler.text;

                callback(jsonArray);
            }
        }
    }

    public IEnumerator GetCards(string cardID, System.Action<string> callback)
    {
        WWWForm form = new WWWForm();
        form.AddField("cardID", cardID);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/SchmingusTCG/GetCard.php", form))
        {
            yield return www.SendWebRequest();

            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                // Show results as text
                Debug.Log(www.downloadHandler.text);
                string jsonArray = www.downloadHandler.text;

                callback(jsonArray);
            }
        }
    }

    public IEnumerator SellCard(string ID, string userID, string cardID)
    {
        WWWForm form = new WWWForm();
        form.AddField("ID", ID);
        form.AddField("cardID", cardID);
        form.AddField("userID", userID);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/SchmingusTCG/SellCard.php", form))
        {
            yield return www.SendWebRequest();

            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                Debug.Log(www.downloadHandler.text);
            }
        }
    }

    public IEnumerator GetCardIcon(string cardID, System.Action<byte[]> callback)
    {
        WWWForm form = new WWWForm();
        form.AddField("cardID", cardID);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/SchmingusTCG/GetCardArt.php", form))
        {
            yield return www.SendWebRequest();

            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                Debug.Log("DOWNLOADING ITEM " + cardID);
                // Results as byte array
                byte[] bytes = www.downloadHandler.data;

                callback(bytes);
            }
        }
    }

    public IEnumerator GetMoney(SellDelete sd)
    {
        yield return new WaitForSeconds(0.1f);
        Debug.Log("GetMoney");
        WWWForm form = new WWWForm();
        form.AddField("userID", Main.Instance.userInfo.UserID);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/SchmingusTCG/GetMoney.php", form))
        {
            yield return www.SendWebRequest();
            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                bool isSelling = true;
                Debug.Log(www.downloadHandler.text);
                Main.Instance.userInfo.Money = www.downloadHandler.text;
                Main.Instance.userInfo.setMoney.UpdateMoney(isSelling);
            }
        }
        sd.DeleteCard();
    }

    public IEnumerator MineMoney(int moneyToAdd)
    {
        Debug.Log("MineMoney");
        WWWForm form = new WWWForm();
        form.AddField("userID", Main.Instance.userInfo.UserID);
        form.AddField("moneyToAdd", moneyToAdd);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/SchmingusTCG/MineMoney.php", form))
        {
            yield return www.SendWebRequest();
            if (www.isNetworkError || www.isHttpError)
            {
                Debug.Log(www.error);
            }
            else
            {
                bool isSelling = false;
                Debug.Log(www.downloadHandler.text);
                Main.Instance.userInfo.Money = www.downloadHandler.text;
                Main.Instance.userInfo.setMoney.UpdateMoney(isSelling);
            }
        }
    }
}
