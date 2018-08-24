<?php
// src/Controller/LuckyController.php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class LuckyController extends Controller
{
    public function number(Request $request)
    {

        $number = mt_rand(0, 100);

        return $this->render('number.html.twig', array(
            'number' => $number,
        ));
    }
}