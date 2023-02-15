<%@include file="template/header.jsp" %>
<!-- Blog -->
<link rel="stylesheet" type="text/css" href="styles/blog.css">
<link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">

<!-- Home -->
<a href="blog.jsp"></a>

<div class="home">
    <div class="breadcrumbs_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="${path}/home">Home</a></li>
                            <li>Blog</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>			
</div>

<!-- Blog -->

<div class="blog">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="blog_post_container">

                    <!-- Blog Post -->
                    <c:forEach items="${BloggDAO.getAllBlogg()}" var="x">
                        <div class="blog_post trans_200">
                        <div class="blog_post_image"><img src="${x.getBlogImage()}" alt=""></div>
                        <div class="blog_post_body">
                            <div class="blog_post_title"><a href="${path}/blog_single?BlogID=${x.getBlogID()}">${x.getBlogTitler()}</a></div>
                            <div class="blog_post_meta">
                                <ul>
                                    <li><a href="#">${UserDAO.getUserByUserID(x.getUserID()).getUserName()}</a></li>
                                    <li><a href="#">${x.getPostDate()}</a></li>
                                </ul>
                            </div>
                            <div class="blog_post_text">
                                <p>${BloggDAO.getShortString(x.getBlogDescription(), 15)}...</p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <div class="load_more trans_200"><a href="#">load more</a></div>
            </div>
        </div>
    </div>
</div>

<!-- Newsletter -->
<div class="newsletter">
    <div class="newsletter_background" style="background-image:url(images/newsletter_background.jpg)"></div>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="newsletter_container d-flex flex-lg-row flex-column align-items-center justify-content-start">

                    <!-- Newsletter Content -->
                    <div class="newsletter_content text-lg-left text-center">
                        <div class="newsletter_title">sign up for news and offers</div>
                        <div class="newsletter_subtitle">Subcribe to lastest smartphones news & great deals we offer</div>
                    </div>

                    <!-- Newsletter Form -->
                    <div class="newsletter_form_container ml-lg-auto">
                        <form action="#" id="newsletter_form" class="newsletter_form d-flex flex-row align-items-center justify-content-center">
                            <input type="email" class="newsletter_input" placeholder="Your Email" required="required">
                            <button type="submit" class="newsletter_button">subscribe</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="template/footer.jsp" %>

