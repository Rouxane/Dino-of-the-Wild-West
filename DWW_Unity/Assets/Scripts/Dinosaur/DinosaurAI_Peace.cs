using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DinosaurAI_Peace : MonoBehaviour
{
    public enum State
    {
         Walk,
         Eat,
         Watch,
         RunAway,
         Soul,
         Tamed
    }

    [Header("Settings")]
    [SerializeField] private Camera _camera;
    [SerializeField] private NavMeshAgent agent;
    [SerializeField] private Animator animator;
    [SerializeField] private GameObject pathRoot;
    [SerializeField] private GameObject targetRoot;
    [SerializeField] private GameObject player;
    [SerializeField] private PlayerController playerControl;
    [SerializeField] private GameObject canvasTame;
    [SerializeField] private GameObject canvasSoul;
    [SerializeField] private Target targetPrefab;
    [SerializeField] private GameObject soulBar;
    [SerializeField] private GameObject soulBarSprite;

    [Header("State Settings")]
    [SerializeField] private bool _tamed = false;
    [SerializeField] public bool mounted = false;
    [SerializeField] private State _currentState = State.Walk;
    [SerializeField] private float _stateTimer;

    [Header("Walking Settings")]
    [SerializeField] private Vector3 _pathZone = Vector3.zero;
    [SerializeField] private Vector3 _randomWayPoint;
    [SerializeField] private Vector3 _newPos;
    [SerializeField] private float _distanceToNewPos;
    [SerializeField] private float _distanceToPlayer;

    [Header("Eating Settings")]
    
    [Header("Watching Settings")]

    [Header("Running Away Settings")]
    [SerializeField] private float _runAwayDistance = 15.0f;
    [SerializeField] private Vector3 _randomRunPoint;
    [SerializeField] private Vector3 _newPosToRun;
    [SerializeField] private float _distanceToRunPos;

    [Header("Soul Settings")]
    [SerializeField] private float _soulGauge = 50.0f;
    [SerializeField] private float _percentSoulGauge;
    [SerializeField] private Vector3 _targetZone = Vector3.zero;
    [SerializeField] private Vector3 _randomTargetPoint;
    [SerializeField] private Vector3 _newPosTarget;

    [Header("Tamed Settings")]
    [SerializeField] private float _tameDistance = 5.0f;
    [SerializeField] private Vector3 moveDirection = Vector3.zero;
    [SerializeField] private float _speed = 6.0F;
    [SerializeField] private float _gravity = 20.0F;
    [SerializeField] private float _rotSpeed = 5.0f;

    // Start is called before the first frame update
    void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        animator = GetComponent<Animator>();
        playerControl = player.GetComponent<PlayerController>();
    }

    // Update is called once per frame
    void Update()
    {
        if (!mounted)
        {
            DoStateBehaviour();
        }
        else
        {
            transform.position = player.transform.position;

            ComputeMove();

            if (moveDirection != Vector3.zero)
            {
                animator.SetBool("State Walk", true);
                Rotate();
            }
            else
            {
                animator.SetBool("State Walk", false);
            }

        }
    }

    private void ComputeMove()
    {
        moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
        moveDirection = _camera.transform.TransformDirection(moveDirection);
        moveDirection *= _speed;
    }

    private void Rotate()
    {
        Vector3 lookDirection = moveDirection;
        lookDirection.y = 0;

        Quaternion rotation = Quaternion.LookRotation(lookDirection);
        transform.rotation = Quaternion.Slerp(transform.rotation, rotation, _rotSpeed * Time.deltaTime);
    }

    private void DoStateBehaviour()
    {
        _pathZone = pathRoot.transform.position;
        _targetZone = targetRoot.transform.position;
        _distanceToPlayer = Vector3.Distance(transform.position, player.transform.position);
        _distanceToNewPos = Vector3.Distance(transform.position, _newPos);
        _distanceToRunPos = Vector3.Distance(transform.position, _newPosToRun);

        switch (_currentState)
        {
            case State.Walk:
                {
                    // (Player pas accroupi && Player dans la zone de detection) || Player accroupi mais trop proche
                    //if (((!playerControl.crouch) && (_distanceToPlayer < _runAwayDistance)) || (_distanceToPlayer < 5.0f))
                    //{
                    //    _newPos = Vector3.zero;
                    //    _randomWayPoint = Vector3.zero;
                    //    agent.ResetPath();
                    //    animator.SetBool("State Walk", false);

                    //    _currentState = State.RunAway;
                    //    DoStateBehaviour();
                    //}
                    // Dinosaure atteint sa destination
                    /*else*/ if (_distanceToNewPos < 2.0f)
                    {
                        _newPos = Vector3.zero;
                        _randomWayPoint = Vector3.zero;
                        agent.ResetPath();
                        animator.SetBool("State Walk", false);

                        ChangeState();
                    }
                    // Player dans la zone du Monde des ames
                    //else if ((_distanceToPlayer < 10.0f) && (Input.GetKeyDown(KeyCode.E)))
                    //{
                    //    _newPos = Vector3.zero;
                    //    _randomWayPoint = Vector3.zero;
                    //    agent.ResetPath();
                    //    animator.SetBool("State Walk", false);

                    //    _currentState = State.Soul;
                    //    DoStateBehaviour();
                    //}
                    else
                    {
                        Walk();
                    }
                    break;
                }
            case State.Eat:
                {
                    // (Player pas accroupi && Player dans la zone de detection) || Player accroupi mais trop proche
                    //if (((!playerControl.crouch) && (_distanceToPlayer < _runAwayDistance)) || (_distanceToPlayer < 5.0f))
                    //{
                    //    _stateTimer = 0.0f;
                    //    animator.SetBool("State Eat", false);

                    //    _currentState = State.RunAway;
                    //    DoStateBehaviour();
                    //}
                    // Animation finie
                    /*else*/ if (_stateTimer > 5.0f)
                    {
                        _stateTimer = 0.0f;
                        animator.SetBool("State Eat", false);

                        ChangeState();
                    }
                    // Player dans la zone du Monde des ames
                    //else if ((_distanceToPlayer < 10.0f) && (Input.GetKeyDown(KeyCode.E)))
                    //{
                    //    _stateTimer = 0.0f;
                    //    animator.SetBool("State Eat", false);

                    //    _currentState = State.Soul;
                    //    DoStateBehaviour();
                    //}
                    else
                    {
                        Eat();
                    }
                    break;
                }
            case State.Watch:
                {
                    // (Player pas accroupi && Player dans la zone de detection) || Player accroupi mais trop proche
                    //if (((!playerControl.crouch) && (_distanceToPlayer < _runAwayDistance)) || (_distanceToPlayer < 5.0f))
                    //{
                    //    _stateTimer = 0.0f;
                    //    animator.SetBool("State Watch", false);

                    //    _currentState = State.RunAway;
                    //    DoStateBehaviour();
                    //}
                    // Animation finie
                    /*else*/ if (_stateTimer > 4.0f)
                    {
                        _stateTimer = 0.0f;
                        animator.SetBool("State Watch", false);

                        ChangeState();
                    }
                    // Player dans la zone du Monde des ames
                    //else if ((_distanceToPlayer < 10.0f) && (Input.GetKeyDown(KeyCode.E)))
                    //{
                    //    _stateTimer = 0.0f;
                    //    animator.SetBool("State Watch", false);

                    //    _currentState = State.Soul;
                    //    DoStateBehaviour();
                    //}
                    else
                    {
                        Watch();
                    }
                    break;
                }
            //case State.RunAway:
            //    {
            //        // Dinosaure atteint sa destination
            //        if (_distanceToRunPos < 2.0f)
            //        {
            //            _newPosToRun = Vector3.zero;
            //            _randomRunPoint = Vector3.zero;
            //            agent.ResetPath();
            //            animator.SetBool("State Run Away", false);

            //            ChangeState();
            //        }
            //        else
            //        {
            //            RunAway();
            //        }              
            //        break;
            //    }
            //case State.Soul:
            //    {
            //        if (_soulGauge <= 0)
            //        {
            //            _soulGauge = 50.0f;
            //            canvasSoul.SetActive(false);
            //            soulBar.SetActive(false);
            //            animator.SetBool("State Soul", false);

            //            _currentState = State.RunAway;
            //            DoStateBehaviour();
            //        }
            //        else if (_soulGauge >= 100)
            //        {
            //            canvasSoul.SetActive(false);
            //            soulBar.SetActive(false);
            //            animator.SetBool("State Soul", false);

            //            _currentState = State.Tamed;
            //            DoStateBehaviour();
            //        }
            //        else
            //        {
            //            Soul();
            //        }
            //        break;
            //    }
            //case State.Tamed:
            //    {
            //        if (Input.GetKeyDown(KeyCode.E))
            //        {
            //            mounted = true;
            //        }
            //        break;
            //    }
        }
    }

    private void ChangeState()
    {
        if (_tamed)
        {
            _currentState = (State)Random.Range(1, 3);
        }
        else
        {
            _currentState = (State)Random.Range(0, 3);
        }

        DoStateBehaviour();
    }

    private void Walk()
    {
        if(_randomWayPoint == Vector3.zero)
        {
            _randomWayPoint = Random.insideUnitSphere * 18;
            _randomWayPoint.y = 0;
            _newPos = _pathZone + _randomWayPoint;
            agent.SetDestination(_newPos);
        }

        animator.SetBool("State Walk", true);
    }

    private void Eat()
    {
        _stateTimer += Time.deltaTime;

        animator.SetBool("State Eat", true);
    }

    private void Watch()
    {
        _stateTimer += Time.deltaTime;

        animator.SetBool("State Watch", true);
    }

    //private void RunAway()
    //{
    //    if (_randomRunPoint == Vector3.zero)
    //    {
    //        _randomRunPoint = Random.insideUnitSphere * 18;
    //        _randomRunPoint.y = 0;
    //        _newPosToRun = _pathZone + _randomRunPoint;
    //        agent.SetDestination(_newPosToRun);
    //    }

    //    animator.SetBool("State Run Away", true);
    //}

    //private void Soul()
    //{
    //    if (!canvasSoul.activeSelf)
    //    {
    //        canvasSoul.SetActive(true);
    //    }

    //    if (!soulBar.activeSelf)
    //    {
    //        soulBar.SetActive(true);
    //    }

    //    if (_randomTargetPoint == Vector3.zero || _stateTimer > 2.0f)
    //    {
    //        _randomTargetPoint = Random.insideUnitSphere;
    //        _newPosTarget = _targetZone + _randomTargetPoint;
    //        _stateTimer = 0;
    //        SpawnTarget();
    //    }

    //    _stateTimer += Time.deltaTime;
    //    _soulGauge -= Time.deltaTime * 5;

    //    SetSizeSoulBar();

    //    animator.SetBool("State Soul", true);
    //}

    //private void SpawnTarget()
    //{
    //    Target target = DataBaseManager.Instance.dataBase.target;
    //    if (target == null)
    //    {
    //        Debug.LogError("Missing Target Reference");
    //    }
    //    else
    //    {
    //        Target newTarget = Instantiate(target);
    //        newTarget.transform.position = _newPosTarget;
    //        newTarget.DinosaurInstance = this;
    //    }
    //}

    //public void TargetDestroyed()
    //{
    //    _soulGauge += 50.0f;
    //}

    //private void SetSizeSoulBar()
    //{
    //    _percentSoulGauge = _soulGauge / 100;
    //    soulBarSprite.transform.localScale = new Vector3(_percentSoulGauge, 1, 1);
    //}

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.cyan;
        Gizmos.DrawWireSphere(_pathZone, 18.0f);

        Gizmos.color = Color.blue;
        Gizmos.DrawWireSphere(_newPos, 1.0f);
        Gizmos.DrawRay(_newPos, Vector3.up * 5);

        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(_newPosToRun, 1.0f);
        Gizmos.DrawRay(_newPosToRun, Vector3.up * 5);

        Gizmos.color = Color.black;
        Gizmos.DrawWireSphere(_targetZone, 1.0f);
    }
}
