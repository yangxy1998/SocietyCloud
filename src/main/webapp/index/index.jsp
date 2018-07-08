<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/5
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团Cloud</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="./assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="./assets/css/main.css" />
</head>
<body class="landing">

<!-- Page Wrapper -->
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" class="alt">
        <jsp:useBean id="user" class="model.entity.User" scope="session" />
        <h1><a href="index.html"><b>首页</b></a></h1>
        <nav id="nav">
            <ul>
                <li class="special">
                    <a href="#menu" class="menuToggle"><span><b>菜单</b></span></a>
                    <div id="menu">
                        <ul>
                            <li><a href="index.html">主页</a></li>
                            <li><a href="generic.html">管理社团</a></li>
                            <li><a href="elements.html">查看社团</a></li>
                            <form>
                                <input type="text" name="in">
                                <input type="submit">
                            </form>
                            <h2>
                                ${param.in};
                                ${user.userName};
                            </h2>
                            <li><a href="../login/login.html">登录</a></li>
                            <li><a href="../register/register.html">注册</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
    </header>

    <!-- Banner -->
    <section id="banner">
        <div class="inner">
            <h2>社团Cloud</h2>
            <p>XX<br />
                XXX<br />
                XX <a href="http://html5up.net">CLJ</a>.</p>
            <ul class="actions">
                <li><a href="#" class="button special">Activate</a></li>
            </ul>
        </div>
        <a href="#one" class="more scrolly">查看更多</a>
    </section>

    <!-- One -->
    <section id="one" class="wrapper style1 special">
        <div class="inner">
            <header class="major">
                <h2>社团云介绍<br />
                    eget augue amet aliquet nisl cep donec</h2>
                <p>Aliquam ut ex ut augue consectetur interdum. Donec amet imperdiet eleifend<br />
                    fringilla tincidunt. Nullam dui leo Aenean mi ligula, rhoncus ullamcorper.</p>
            </header>
            <ul class="icons major">
                <li><span class="icon fa-diamond major style1"><span class="label">Lorem</span></span></li>
                <li><span class="icon fa-heart-o major style2"><span class="label">Ipsum</span></span></li>
                <li><span class="icon fa-code major style3"><span class="label">Dolor</span></span></li>
            </ul>
        </div>
    </section>
    <div class="chs">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>

    <!-- Two -->
    <section id="two" class="wrapper alt style2">
        <section class="spotlight">
            <div class="image"><img src="./images/pic01.jpg" alt="" /></div><div class="content">
            <h2>Magna primis lobortis<br />
                sed ullamcorper</h2>
            <p>Aliquam ut ex ut augue consectetur interdum. Donec hendrerit imperdiet. Mauris eleifend fringilla nullam aenean mi ligula.</p>
        </div>
        </section>
        <section class="spotlight">
            <div class="image"><img src="./images/pic02.jpg" alt="" /></div><div class="content">
            <h2>Tortor dolore feugiat<br />
                elementum magna</h2>
            <p>Aliquam ut ex ut augue consectetur interdum. Donec hendrerit imperdiet. Mauris eleifend fringilla nullam aenean mi ligula.</p>
        </div>
        </section>
        <section class="spotlight">
            <div class="image"><img src="./images/pic03.jpg" alt="" /></div><div class="content">
            <h2>Augue eleifend aliquet<br />
                sed condimentum</h2>
            <p>Aliquam ut ex ut augue consectetur interdum. Donec hendrerit imperdiet. Mauris eleifend fringilla nullam aenean mi ligula.</p>
        </div>
        </section>
    </section>

    <!-- Three -->
    <section id="three" class="wrapper style3 special">
        <div class="inner">
            <header class="major">
                <h2>Accumsan mus tortor nunc aliquet</h2>
                <p>Aliquam ut ex ut augue consectetur interdum. Donec amet imperdiet eleifend<br />
                    fringilla tincidunt. Nullam dui leo Aenean mi ligula, rhoncus ullamcorper.</p>
            </header>
            <ul class="features">
                <li class="icon fa-paper-plane-o">
                    <h3>Arcu accumsan</h3>
                    <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                </li>
                <li class="icon fa-laptop">
                    <h3>Ac Augue Eget</h3>
                    <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                </li>
                <li class="icon fa-code">
                    <h3>Mus Scelerisque</h3>
                    <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                </li>
                <li class="icon fa-headphones">
                    <h3>Mauris Imperdiet</h3>
                    <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                </li>
                <li class="icon fa-heart-o">
                    <h3>Aenean Primis</h3>
                    <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                </li>
                <li class="icon fa-flag-o">
                    <h3>Tortor Ut</h3>
                    <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                </li>
            </ul>
        </div>
    </section>

</div>

<!-- Scripts -->
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/jquery.scrollex.min.js"></script>
<script src="./assets/js/jquery.scrolly.min.js"></script>
<script src="./assets/js/skel.min.js"></script>
<script src="./assets/js/util.js"></script>
<!--[if lte IE 8]><script src="./assets/js/ie/respond.min.js"></script><![endif]-->
<script src="./assets/js/main.js"></script>

</body>
</html>
