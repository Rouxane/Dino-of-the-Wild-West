using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuManager : MonoBehaviour
{
    [SerializeField] private GameObject canvasMenu;
    [SerializeField] private GameObject canvasMap;
    [SerializeField] private GameObject canvasMiniMap;

    [SerializeField] private bool _echapOn = false;
    [SerializeField] private bool _mapOn = false;

    private void Update()
    {
        if (!_echapOn)
        {
            if (Input.GetKeyDown(KeyCode.Escape))
            {
                ActiveMenu();
            }
            else if (!_mapOn)
            {
                if (Input.GetKeyDown(KeyCode.M))
                {
                    ActiveMap();
                }
            }
            else if (Input.GetKeyDown(KeyCode.M))
            {
                DesactivateMap();
            }
        }
        else if (Input.GetKeyDown(KeyCode.Escape))
        {
            DesactivateMenu();
        }
    }

    void ActiveMenu()
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        Time.timeScale = 0;
        AudioListener.pause = true;
        canvasMiniMap.SetActive(false);
        canvasMenu.SetActive(true);
        _echapOn = true;
    }

    public void DesactivateMenu()
    {
        if (!_mapOn)
        {
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }

        Time.timeScale = 1;
        AudioListener.pause = false;
        canvasMenu.SetActive(false);
        if (!_mapOn)
        {
            canvasMiniMap.SetActive(true);
        }
        _echapOn = false;
    }

    void ActiveMap()
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        Time.timeScale = 0;
        canvasMiniMap.SetActive(false);
        canvasMap.SetActive(true);
        _mapOn = true;
    }

    public void DesactivateMap()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;

        Time.timeScale = 1;
        canvasMap.SetActive(false);
        canvasMiniMap.SetActive(true);
        _mapOn = false;
    }

    public void QuitGame()
    {
        Application.Quit();
    }

    public void ReturnMenu()
    {
        SceneManager.LoadScene(0);
    }
}
