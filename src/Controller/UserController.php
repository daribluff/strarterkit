<?php
// src/Controller/UserController.php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class UserController extends Controller
{
    public function facebookAuthLoginAction(Request $request)
    {
        $number = mt_rand(0, 100);

        return $this->render('number.html.twig', array(
            'number' => $number,
        ));
    }
}