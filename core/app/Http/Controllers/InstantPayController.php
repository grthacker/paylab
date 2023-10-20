<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Models\PaymentLog;


class InstantPayController extends Controller
{
    private $clientID;
    private $client_secret;
    private $EnKey;

    public $activeTemplate;
    private $public_ip;
    public function __construct()
    {
        $this->activeTemplate = activeTemplate();
        $this->clientID = 'YWY3OTAzYzNlM2ExZTJlOVNN1AdH6z238AnlhfwRPAk=';
        $this->client_secret = '09d4f102f78c228d2fffc9fc60027c38a558dcecd1ff2a09895cd3048d512bc5';
        $this->EnKey = '500605877e09a340500605877e09a340';
        $this->public_ip = file_get_contents('https://api.ipify.org');
    }

    public function bank()
    {

        $client = new \GuzzleHttp\Client();


        $headers = [
            'accept' => 'application/json',
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'X-Ipay-Outlet-Id' => $this->EnKey

        ];

        $response = $client->request('GET', 'https://api.instantpay.in/fi/aeps/banks', [
            'headers' => $headers,
        ]);

        $log = new PaymentLog();
        $log->log = $response->getBody();
        $log->save();
        echo $response->getBody();
    }

    public function bankAccount(Request $request)
    {
        $request->validate([
            'bankProfileId' => 'required|string|max:50',
            'accountNumber' => 'required|string|max:50',
            'bankIfsc' => 'required|string|max:50',
            'alertEmail' => 'sometime|email',
            'externalRef' => 'required|string|max:50',
            'transferAmount' => 'required'
        ], [
            'accountNumber.required' => 'Account Number Field is required',
            'bankProfileId.required' => 'Bank Profile Id Field is required',
            'bankIfsc.required' => 'Bank IFSC Field is required',
            'externalRef.required' => 'Externak Ref Field is required'
        ]);

        $requestData =  $request->all();
        $client = new \GuzzleHttp\Client();

        $headers = [
            'X-Ipay-Auth-Code' => 'your_auth_code',
            'X-Ipay-Client-Id' => 'your_client_id',
            'X-Ipay-Client-Secret' => 'your_client_secret',
            'X-Ipay-Endpoint-Ip' => 'your_endpoint_ip',
            'Content-Type' => 'application/json',
        ];

        $data = [
            "payer" => [
                "bankProfileId" => $requestData['bankProfileId'],
                "accountNumber" => $requestData['accountNumber']
            ],
            "payee" => [
                "name" => "Sh***az",
                "accountNumber" => $requestData['accountNumber'],
                "bankIfsc" => $requestData['bankIfsc']
            ],
            "transferMode" => "IMPS",
            "transferAmount" => $requestData['transferAmount'],
            "externalRef" => $requestData['externalRef'],
            "latitude" => "20.**36",
            "longitude" => "78.**28",
            "remarks" => "Test",
            "alertEmail" => "",
            "purpose" => "REIMBURSEMENT",
            "otp" => "",
            "otpReference" => ""
        ];

        $response = $client->request('POST', 'https://api.instantpay.in/payments/payout', [
            'headers' => $headers,
            'json' => $data,
        ]);
        $log = new PaymentLog();
        $log->log = $response->getBody();
        $log->save();
        echo $response->getBody();
    }

    public function OutletLoginStatus()
    {

        $client = new \GuzzleHttp\Client();

        $response = $client->request('POST', 'https://api.instantpay.in/fi/aeps/outletLoginStatus', [
            'headers' => [
                'accept' => 'application/json',
            ],
            'form_params' => [
                'param1' => 'value1',
                'param2' => 'value2',

            ]
        ]);
    }


    public function payoutBanks()
    {

        $client = new \GuzzleHttp\Client();

        $response = $client->request('GET', 'https://api.instantpay.in/payments/payout/banks', [
            'headers' => [
                'X-Ipay-Auth-Code' => '1',
                'X-Ipay-Client-Id' => $this->clientID,
                'X-Ipay-Client-Secret' => $this->client_secret,
                'X-Ipay-Endpoint-Ip' => $this->public_ip,
                'X-Ipay-Outlet-Id' => '',
                'accept' => 'application/json',
            ],
        ]);
        $log = new PaymentLog();
        $log->log = $response->getBody();
        $log->save();
        echo $response->getBody();
    }

    public function getMerchantList()
    {

        $headers = [
            'Accept' => 'application/json',
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'Content-Type' => 'application/json'
        ];
        $data = [
            "pagination" => [
                "pageNumber" => 1,
                "recordsPerPage" => "10"
            ],
            "filters" => [
                "outletId" => 0,
                "mobile" => "",
                "pan" => ""
            ]
        ];
        $client = new Client();

        $response = $client->request('POST', 'https://api.instantpay.in/user/outlet/list', [
            'headers' => $headers,
            'json' => $data
        ]);

        $log = new PaymentLog();
        $log->log = $response->getBody();
        $log->save();
        echo $this->aadhaarEncryption('835965914289');
        die();
        echo $response->getBody();
    }






    public function miniStatement(Request $request)
    {
        $requestData = $request->all();
        $client = new Client();

        $authCode = 1;
        $clientId = $this->clientID;
        $clientSecret = $this->client_secret;
        $endPointIP = $this->public_ip;

        $data = '{
            "bankiin": ' . $requestData['bankiin'] . ',
            "latitude": ' . $requestData['latitude'] . ',
            "longitude": ' . $requestData['longitude'] . ',
            "mobile": ' . $requestData['mobile'] . ',
            "externalRef": ' . $requestData['externalRef'] . ',
            "biometricData": {
                "encryptedAadhaar": ' . $requestData['encryptedAadhaar'] . ',
                "dc": ' . $requestData['dc'] . ',
                "ci": ' . $requestData['ci'] . ',
                "hmac": ' . $requestData['hmac'] . ',
                "dpId": "STARTEK.ACPL",
                "mc": ' . $requestData['mc'] . ',
                "pidDataType": "X",
                "sessionKey": ' . $requestData['sessionKey'] . ',
                "mi": ' . $requestData['mi'] . ',
                "rdsId": "ACPL.WIN.001",
                "fType": ' . $requestData['fType'] . ',
                "pType": "",
                "srno": ' . $requestData['srno'] . ',
                "pidData": ' . $requestData['pidData'] . ',
                "qScore": ' . $requestData['qScore'] . ',
                "nmPoints": ' . $requestData['nmPoints'] . ',
                "rdsVer": ' . $requestData['rdsVer'] . ',
            }
         }';

        $response = $client->request('POST', 'https://api.instantpay.in/fi/aeps/miniStatement', [
            'headers' => [
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
                'X-Ipay-Auth-Code' => $authCode,
                'X-Ipay-Client-Id' => $clientId,
                'X-Ipay-Client-Secret' => $clientSecret,
                'X-Ipay-Endpoint-Ip' => $endPointIP,
            ],
            'body' => $data,
        ]);

        $log = new PaymentLog();
        $log->log = $response->getBody();
        $log->save();
        echo $response->getBody();
    }

    public function balanceInquiry(Request $request)
    {
        $requestData = $request->all();
        $client = new Client();

        $authCode = 1;
        $clientId = $this->clientID;
        $clientSecret = $this->client_secret;
        $endPointIP = $this->public_ip;

        $data = '{
            "bankiin": ' . $requestData['bankiin'] . ',
            "latitude": ' . $requestData['latitude'] . ',
            "longitude": ' . $requestData['longitude'] . ',
            "mobile": ' . $requestData['mobile'] . ',
            "externalRef": ' . $requestData['externalRef'] . ',
            "biometricData": {
                "encryptedAadhaar": ' . $requestData['encryptedAadhaar'] . ',
                "dc": ' . $requestData['dc'] . ',
                "ci": ' . $requestData['ci'] . ',
                "hmac": ' . $requestData['hmac'] . ',
                "dpId": "STARTEK.ACPL",
                "mc": ' . $requestData['mc'] . ',
                "pidDataType": "X",
                "sessionKey": ' . $requestData['sessionKey'] . ',
                "mi": ' . $requestData['mi'] . ',
                "rdsId": "ACPL.WIN.001",
                "fType": ' . $requestData['fType'] . ',
                "pType": "",
                "srno": ' . $requestData['srno'] . ',
                "pidData": ' . $requestData['pidData'] . ',
                "qScore": ' . $requestData['qScore'] . ',
                "nmPoints": ' . $requestData['nmPoints'] . ',
                "rdsVer": ' . $requestData['rdsVer'] . ',
            }
         }';

        $response = $client->request('POST', 'https://api.instantpay.in/fi/aeps/balanceInquiry', [
            'headers' => [
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
                'X-Ipay-Auth-Code' => $authCode,
                'X-Ipay-Client-Id' => $clientId,
                'X-Ipay-Client-Secret' => $clientSecret,
                'X-Ipay-Endpoint-Ip' => $endPointIP,
            ],
            'body' => $data,
        ]);

        $log = new PaymentLog();
        $log->log = $response->getBody();
        $log->save();
        echo $response->getBody();
    }


    public function cashWithdrawal(Request $request)
    {
        $requestData = $request->all();
        $client = new Client();

        $authCode = 1;
        $clientId = $this->clientID;
        $clientSecret = $this->client_secret;
        $endPointIP = $this->public_ip;

        $data = '{
            "bankiin": ' . $requestData['bankiin'] . ',
            "latitude": ' . $requestData['latitude'] . ',
            "longitude": ' . $requestData['longitude'] . ',
            "mobile": ' . $requestData['mobile'] . ',
            "amount": ' . $requestData['amount'] . ',
            "externalRef": ' . $requestData['externalRef'] . ',
            "biometricData": {
                "encryptedAadhaar": ' . $requestData['encryptedAadhaar'] . ',
                "dc": ' . $requestData['dc'] . ',
                "ci": ' . $requestData['ci'] . ',
                "hmac": ' . $requestData['hmac'] . ',
                "dpId": "STARTEK.ACPL",
                "mc": ' . $requestData['mc'] . ',
                "pidDataType": "X",
                "sessionKey": ' . $requestData['sessionKey'] . ',
                "mi": ' . $requestData['mi'] . ',
                "rdsId": "ACPL.WIN.001",
                "fType": ' . $requestData['fType'] . ',
                "pType": "",
                "srno": ' . $requestData['srno'] . ',
                "pidData": ' . $requestData['pidData'] . ',
                "qScore": ' . $requestData['qScore'] . ',
                "nmPoints": ' . $requestData['nmPoints'] . ',
                "rdsVer": ' . $requestData['rdsVer'] . ',
            }
         }';

        $response = $client->request('POST', 'https://api.instantpay.in/fi/aeps/cashWithdrawal', [
            'headers' => [
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
                'X-Ipay-Auth-Code' => $authCode,
                'X-Ipay-Client-Id' => $clientId,
                'X-Ipay-Client-Secret' => $clientSecret,
                'X-Ipay-Endpoint-Ip' => $endPointIP,
            ],
            'body' => $data,
        ]);
        $log = new PaymentLog();
        $log->log = $response->getBody();
        $log->save();
        echo $response->getBody();
    }

    public function aadhaarEncryption($aadhaarNumber){
        $aadhaarNumber=$aadhaarNumber;
        $encryptionKey= $this->EnKey;
        $ivlen = openssl_cipher_iv_length('aes-256-cbc');
        $iv = openssl_random_pseudo_bytes($ivlen);
        $ciphertext = openssl_encrypt($aadhaarNumber,'aes-256-cbc', $encryptionKey, OPENSSL_RAW_DATA, $iv);
        $encryptedData = base64_encode($iv . $ciphertext);
		return $encryptedData;
    }
}
