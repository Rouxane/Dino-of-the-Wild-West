using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Arrow : MonoBehaviour
{
    private Rigidbody _rB;
    private float _lifeTime = 0;

    // Start is called before the first frame update
    void Start()
    {
        _rB = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        transform.rotation = Quaternion.LookRotation(_rB.velocity);

        _lifeTime += Time.deltaTime;

        if (_lifeTime > 2.0f)
        {
            Destroy(gameObject);
        }
    }
}
