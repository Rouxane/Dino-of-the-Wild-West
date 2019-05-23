using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    public float speed = 6.0F;
    public float gravity = 20.0F;
    private Vector3 moveDirection = Vector3.zero;

    public bool crouch;
    private int crouchSet = 0;

    CharacterController m_characterCollider;

    // Use this for initialization
    void Start () {
        m_characterCollider = gameObject.GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void Update () {
        CharacterController controller = GetComponent<CharacterController>();
        if (controller.isGrounded)
        {
            moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
            moveDirection = transform.TransformDirection(moveDirection);
            moveDirection *= speed;
        }
        moveDirection.y -= gravity * Time.deltaTime;
        controller.Move(moveDirection * Time.deltaTime);

        // Crouch
        IsPlayerCrouched();
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
