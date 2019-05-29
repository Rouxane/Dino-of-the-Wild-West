using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    [SerializeField] private Camera _camera;

    public float speed = 6.0F;
    public float gravity = 20.0F;
    private Vector3 moveDirection = Vector3.zero;
    [SerializeField] private float _rotSpeed = 5.0f;
    [SerializeField] private float _rotAngle = 45.0f;

    public bool crouch;
    private int crouchSet = 0;

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
            moveDirection *= speed;
        }
    }

    private void DoMove()
    {
        moveDirection.y -= gravity * Time.deltaTime;
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
            transform.localScale = new Vector3(1, 1, 1);
        }

        if (crouchSet == 1)
        {
            crouch = true;
            transform.localScale = new Vector3(1, 0.5f, 1);
        }
    }
}
