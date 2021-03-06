<?php
@session_start();
include("Smarty_Book.php");
include("public/libs/errorMessage.inc");
require_once("models/m_user.php");

/**
 * <pre>
 * <p>[Summary]</p>
 * Controller user
 * </pre>
 *
 * @author ToanLD3
 *
 */
const LINK_HOME = "index.php";

class C_user
{
    function Init_Display()
    {
        if (isset($_SESSION["username"]) && strlen($_SESSION["username"]) > 0)
        {
            header('Location: ' . LINK_HOME);
        }

        $smarty = new Smarty_book();
        $smarty->display("login.tpl");
    }


    function Sign_In()
    {
        $smarty = new Smarty_Book();

        $username = trim($_POST["username"], " ");
        $password = trim($_POST["password"], " ");

        $err[] = checkErrorInputLogin($username, $password);

        if (isset($_POST["btn_login"]))
        {
            $username = $_POST["username"];
            $password = $_POST["password"];

            //Validate
            $err = checkErrorInputLogin($username, $password);
            if (count($err) > 0)
            {
                $smarty->assign("flg_err", $err);
                $smarty->display("login.tpl");
            }
            else
            {
                $m_user = new M_user();
                $user   = $m_user->Login($username, $password);
                if ($user === FALSE)
                {
                    $err[] = ERR105;
                    $smarty->assign("flg_err", $err);
                    $smarty->display("login.tpl");
                }
                else
                {
                    $_SESSION["username"] = $user->ho_ten;
                    $_SESSION["avatar"]   = $user->avatar;
                    $_SESSION['customer'] = $user;
                    header('Location: ' . LINK_HOME);
                }
            }
        }
    }

    function Logout()
    {
        session_destroy();
        header("location:login.php");
    }
}

