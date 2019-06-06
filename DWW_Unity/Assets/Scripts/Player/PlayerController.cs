using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    [SerializeField] private Camera _camera;
    [SerializeField] private Animator _animator;

    public float _speed = 6.0F;
    public float _gravity = 20.0F;
    [SerializeField] private Vector3 moveDirection = Vector3.zero;
    [SerializeField] private float _rotSpeed = 5.0f;
    [SerializeField] private float _rotAngle = 45.0f;

    public bool crouch;
    [SerializeField] private int crouchSet = 0;

    [SerializeField] private CharacterController _characterCollider;
    [SerializeField] private CharacterController _controller;

    // Use this for initialization
    void Start () {
        _characterCollider = gameObject.GetComponent<CharacterController>();
        _controller = GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void Update () {
        //float angleDiff = Vector3.Angle(transform.forward, moveDirection);

        _animator.SetFloat("Speed", _speed);

        ComputeMove();

        if (moveDirection != Vector3.zero)
        {
            Rotate();
        }

        //if (angleDiff < _rotAngle)
        {
            DoMove();
        }

        // Crouch
        IsPlayerCrouched();
    }

    private void ComputeMove()
    {
        if (_controller.isGrounded)
        {
            moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
            moveDirection = _camera.transform.TransformDirection(moveDirection);
            moveDirection *= _speed;
        }
    }

    private void DoMove()
    {
        moveDirection.y -= _gravity * Time.deltaTime;
        _controller.Move(moveDirection * Time.deltaTime);
    }

    private void Rotate()
    {
        Vector3 lookDirection = moveDirection;
        lookDirection.y = 0;

        Quaternion rotation = Quaternion.LookRotation(lookDirection);
        transform.rotation = Quaternion.Slerp(transform.rotation, rotation, _rotSpeed * Time.deltaTime);
    }

    void IsPlayerCrouched()
    {
        if (Input.GetKeyDown(KeyCode.LeftShift))
        {
            CrouchCounter();
        }
    }

    void CrouchCounter()
    {
        crouchSet++;

        if (crouchSet > 1)
        {
            crouchSet = 0;
        }

        if (crouchSet == 0)
        {
            crouch = false;
            _animator.SetInteger("IsCrouching", 2);
            //_animator.SetInteger("IsCrouching", 0);
        }

        if (crouchSet == 1)
        {
            crouch = true;
            _animator.SetInteger("IsCrouching", 1);
            //_animator.SetInteger("IsCrouching", 0);
        }
    }
}
