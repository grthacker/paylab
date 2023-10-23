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

    public function getBillerList()
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
                'categoryKey' => 'C00',
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
            'type' => 'OPERATOR',
            'msisdn' => '',
            'billerId' => 'RJP'
        ];

        try {
            $response = $client->request('POST', 'https://api.instantpay.in/marketplace/utilityPayments/circle', [
                'headers' => $headers,
                'json' => $data,
            ]);

            echo $response->getBody();
        } catch (RequestException $e) {
            if ($e->hasResponse()) {
                echo "Status code: " . $e->getResponse()->getStatusCode() . "\n";
                echo "Response body: " . $e->getResponse()->getBody()->getContents() . "\n";
            } else {
                echo "Request failed: " . $e->getMessage() . "\n";
            }
        }
    }

    public function getRechargePlan(Request $request)
    {

        $subProductCode = $request->operator ?? 'RJA';
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



    public function getMerchantList()
    {

        $headers = [
            'Accept' => 'application/json',
            'X-Ipay-Auth-Code' => '1',
            'X-Ipay-Client-Id' => $this->clientID,
            'X-Ipay-Client-Secret' => $this->client_secret,
            'X-Ipay-Endpoint-Ip' => '180.188.237.1',
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

        echo $response->getBody();
    }
}
