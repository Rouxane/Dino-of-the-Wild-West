using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArrowShooter : MonoBehaviour
{

    [SerializeField] private Animator _animatorPlayer;
    [SerializeField] private Animator _animatorBow;

    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            _animatorPlayer.SetBool("IsShooting", true);
            _animatorBow.SetBool("IsShooting", true);
        }
    }
}
