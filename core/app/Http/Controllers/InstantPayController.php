<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Models\PaymentLog;
use GuzzleHttp\Exception\RequestException;


class InstantPayController extends Controller
{
    private $clientID;
    private $client_secret;
    public $activeTemplate;
    private $public_ip;
    public function __construct()
    {
        $this->activeTemplate = activeTemplate();
        $this->clientID = 'YWY3OTAzYzNlM2ExZTJlOVNN1AdH6z238AnlhfwRPAk=';
        $this->client_secret = '83c573b05885258b8a8a517915af5f9cbeffd1252b10181e577b04aa1fb9a026';
        $this->EnKey = '500605877e09a340500605877e09a340';
        // $this->public_ip = file_get_contents('https://api.ipify.org');
        $this->public_ip = '66.45.237.230';
    }

    public function getBillerList($cate = 'C03')
    {

        $client = new Client();

        $headers = [
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'X-Ipay-Outlet-Id' => '296327'
        ];

        $data = [
            'pagination' => [
                'pageNumber' => 1,
                'recordsPerPage' => 20
            ],
            'filters' => [
                'categoryKey' => $cate,
                'updatedAfterDate' => ''
            ]
        ];

        $response = $client->request('POST', 'https://api.instantpay.in/marketplace/utilityPayments/billers', [
            'headers' => $headers,
            'json' => $data,
        ]);

        $responseBody = $response->getBody()->getContents();
        $responseData = json_decode($responseBody, true);


        return $responseData['data']['records'];
    }

    public function getIp()
    {
        echo $this->public_ip;
    }

    public function telecomCircle()
    {
        $client = new Client();

        $headers = [
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'X-Ipay-Outlet-Id' => '296327'
        ];

        $data = [
            "type" => "MSISDN",
            "msisdn" => "941234",
            "billerId" => ""
        ];

        $response = $client->request('POST', 'https://api.instantpay.in/marketplace/utilityPayments/circle', [
            'headers' => $headers,
            'json' => $data,
        ]);

        $responseBody = $response->getBody()->getContents();
        $responseData = json_decode($responseBody, true);
        dd($responseData);
    }

    public function getRechargePlan(Request $request)
    {

        $subProductCode = $request->operator ?? 'DTH';
        $client = new Client();

        $headers = [
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'X-Ipay-Outlet-Id' => '296327'
        ];

        $data = [
            "subProductCode" => $subProductCode,
            "telecomCircle" => "PB",
            "externalRef" => generateRandomString(10),
            "latitude" => "27.897394",
            "longitude" => "78.088013"
        ];

        $response = $client->request('GET', 'https://api.instantpay.in/marketplace/utilityPayments/rechargePlans', [
            'headers' => $headers,
            'json' => $data,
        ]);
        $responseBody = $response->getBody()->getContents();
        $responseData = json_decode($responseBody, true);

        return $responseData['data']['plans'];
    }

    public function getBillerDetails($cate = 'PSPCL0000PUN01')
    {

        $client = new Client();

        $headers = [
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'X-Ipay-Outlet-Id' => '296327'
        ];

        $data = [
            "billerId" => $cate
        ];

        $response = $client->request('POST', 'https://api.instantpay.in/marketplace/utilityPayments/billerDetails', [
            'headers' => $headers,
            'json' => $data,
        ]);

        $responseBody = $response->getBody()->getContents();
        $responseBody = json_decode($responseBody, true);
        dd($responseBody);
        return $responseBody;
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

        // $log = new PaymentLog();
        // $log->log = $response->getBody();
        // $log->save();

        echo $response->getBody();
    }

    public function getBillEnquiry(Request $request)
    {
        $client = new Client();

        $headers = [
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'X-Ipay-Outlet-Id' => '296327'
        ];

        $data = [
            "billerId" => $request->operator ?? 'ATBROAD00NAT01',
            "initChannel" => "AGT",
            "externalRef" => "123TEST",
            "inputParameters" => [
                "param1" => '9478956789',
            ],
            "deviceInfo" => [
                "mac" => "BC-BE-33-65-E6-AC",
                "ip" => "103.254.205.164"
            ],
            "remarks" => [
                "param1" => 9999999999
            ],
            "transactionAmount" => 10
        ];

        $response = $client->request('POST', 'https://api.instantpay.in/marketplace/utilityPayments/prePaymentEnquiry', [
            'headers' => $headers,
            'json' => $data,
        ]);

        $responseBody = $response->getBody()->getContents();
        $responseBody = json_decode($responseBody, true);

        return $responseBody;
    }

    public function banks()
    {
        $client = new Client();

        $headers = [
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'X-Ipay-Outlet-Id' => '296327'
        ];

        $response = $client->request('GET', 'https://api.instantpay.in/payments/payout/banks', [
            'headers' => $headers,
        ]);

        $responseBody = $response->getBody()->getContents();
        $responseData = json_decode($responseBody, true);

        return $responseData['data'];
    }

    public function bankTransfer($data = '')
    {

        $client = new Client();
        $account =  $data['receiver_account_number']['field_value'];
        $name =  $data['receiver_name']['field_value'];
        $ifsc =  $data['ifsc']['field_value'];
        $amount =  $data['amount']['field_value'];

        $headers = [
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'Content-Type' => 'application/json',
        ];

        $data = [
            "payer" => [
                "bankProfileId" => "1***1",
                "accountNumber" => "0*********5"
            ],
            "payee" => [
                "name" => $name,
                "accountNumber" => $account,
                "bankIfsc" => $ifsc,
                "payeeListId" => " "
            ],
            "transferMode" => "IMPS",
            "transferAmount" => $amount,
            "externalRef" => "IMPS1",
            "latitude" => "28.459497",
            "longitude" => "77.026634",
        ];

        $response = $client->request('POST', 'https://api.instantpay.in/payments/payout', [
            'headers' => $headers,
            'json' => $data,
        ]);

        $responseBody = $response->getBody()->getContents();
        $responseData = json_decode($responseBody, true);

        // $log = new PaymentLog();
        // $log->log = $responseData;
        // $log->save();
        return $responseData;
    }

    public function wallet($data = '')
    {
        $client = new Client();
        $account =  $data['wallet_phone_number']['field_value'];
        $name =  $data['receiver_name']['field_value'];
        $headers = [
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => $this->public_ip,
            'Content-Type' => 'application/json'
        ];

        $data = [
            "payer" => [
                "bankProfileId" => "0",
                "accountNumber" => "***************"
            ],
            "payee" => [
                "name" => $name,
                "accountNumber" => "***************",

            ],
            "transferMode" => "IMPS",
            "transferAmount" => $account,
            "externalRef" => "IMPS1",
            "latitude" => "20.**36",
            "longitude" => "78.**28",
        ];

        $response = $client->request('POST', 'https://api.instantpay.in/payments/payout', [
            'headers' => $headers,
            'json' => $data,
        ]);

        $responseBody = $response->getBody()->getContents();
        $responseData = json_decode($responseBody, true);
    }

    public function dth($data = '')
    {
    }
}
