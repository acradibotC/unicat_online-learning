<%@include file="template/header.jsp" %>
<!-- Blog -->
<link rel="stylesheet" type="text/css" href="${path}/styles/blog.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/blog_responsive.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/pagination.css">
<!-- Home -->

<a href="${path}/blog"></a>


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
<c:if test="${tutor != null || admin != null}">
    <div class="row">
        <div class="col text-center">
            <div class="load_more trans_200"><a href="${path}/blog/add">Add</a></div>
        </div>
    </div>  
</c:if>

<div class="blog">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="blog_post_container">
                    <!-- Blog Post -->
                    <c:if test="${list != null}">
                        <c:forEach items="${list}" var="x">
                            <div class="blog_post trans_200">
                                <div class="blog_post_image" style="background-size: cover;"><img style="max-width: 360px; max-height: 170px;" src="${x.getBlogImage()}" alt=""></div>
                                <div class="blog_post_body">
                                    <div class="blog_post_title"><a href="${path}/blog/single?BlogID=${x.getBlogID()}">${x.getBlogTitler()}</a></div>
                                    <div class="blog_post_meta">
                                        <ul>
                                            <li><a href="#">${UserDAO.getUserByUserID(x.getUserID()).getUserName()}</a></li>
                                            <li><a href="#">${x.getPostDate()}</a></li>
                                        </ul>
                                    </div>
                                    <div class="blog_post_text">
                                        <p>${BlogDAO.getShortString(x.getBlogDescription(), 8)}...</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${AllBlog.size() > 6}">
        <div class="paginationBlog">
            <c:if test="${page == 1}">
                <li class="page-itemBlog previous-page BlogDisable"><a class="page-linkBlog" href="">Prev</a></li>
                </c:if>
                <c:if test="${page != 1}">
                <li class="page-itemBlog previous-page"><a class="page-linkBlog" href="${path}/blog/paging?page=${page-1}">Prev</a></li>
                </c:if>

            <c:forEach begin="${1}" end="${number}" var="i">    
                <c:choose>
                    <c:when test="${page == i}">
                        <input type="hidden" name="page" value="${i}" />
                        <li class="page-itemBlog current-page BlogActive"><a class="page-linkBlog" href="${path}/blog/paging?page=${i}">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                        <input type="hidden" name="page" value="${i}" />
                        <li class="page-itemBlog current-page"><a class="page-linkBlog" href="${path}/blog/paging?page=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

            <c:if test="${page == number}">
                <li class="page-itemBlog next-page BlogDisable"><a class="page-linkBlog" href="">Next</a></li>
                </c:if>    
                <c:if test="${page != number}">
                <li class="page-itemBlog next-page"><a class="page-linkBlog" href="${path}/blog/paging?page=${page+1}">Next</a></li>
                </c:if>    
        </div>
    </c:if>
    <c:if test="${AllBlog.size() == 0}">
        <div class="paginationBlog">No Items Found!</div>
    </c:if>
</div>




<!-- Newsletter -->

<div class="newsletter">
    <div class="newsletter_background" style="background-image:url(${path}/images/newsletter_background.jpg)"></div>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="newsletter_container d-flex flex-lg-row flex-column align-items-center justify-content-start">

                    <!-- Newsletter Content -->
                    <div class="newsletter_content text-lg-left text-center">
                        <div class="newsletter_title">sign up for news and offers</div>
                        <div class="newsletter_subtitle">Subcribe to lastest lessons news & great deals we offer</div>
                    </div>

                    <!-- Newsletter Form -->
                    <c:if test="${User eq null}">
                        <div class="newsletter_form_container ml-lg-auto">
                            <form action="${path}/user/login" id="newsletter_form" class="newsletter_form d-flex flex-row align-items-center justify-content-center">
                                <button type="submit" class="newsletter_button">subscribe</button>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${User ne null}">
                        <div class="newsletter_form_container ml-lg-auto">
                            <form action="${path}/courses" id="newsletter_form" class="newsletter_form d-flex flex-row align-items-center justify-content-center">
                                <button type="submit" class="newsletter_button">subscribe</button>
                            </form>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="template/footer.jsp" %>

