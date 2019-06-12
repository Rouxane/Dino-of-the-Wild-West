using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationFunction : MonoBehaviour
{
    private Animator _animatorPlayer;
    private Animator _animatorBow;
    [SerializeField] private GameObject _rootArrow;

    private void Start()
    {
        _animatorPlayer = GetComponent<Animator>();
        _animatorBow = GetComponentInChildren<Animator>();
    }

    public void SwitchOffBool()
    {
        _animatorPlayer.SetBool("IsShooting", false);
        _animatorBow.SetBool("IsShooting", false);
    }

    public void SpawnArrow()
    {
        Arrow arrow = DataBaseManager.Instance.dataBase.arrow;
        if (arrow == null)
        {
            Debug.LogError("Missing Arrow Reference");
        }
        else
        {
            Arrow newArrow = Instantiate(arrow);
            newArrow.transform.position = _rootArrow.transform.position;
            Rigidbody _rB = newArrow.GetComponent<Rigidbody>();
            _rB.velocity = Camera.main.transform.forward * 30;
        }
    }
}
