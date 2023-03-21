<%@include file="template/header.jsp" %>
<!-- About -->
<link rel="stylesheet" type="text/css" href="${path}/styles/about.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/about_responsive.css">

<!-- Home -->
<div class="home">
    <div class="breadcrumbs_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="${path}/home">Home</a></li>
                            <li>About</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>			
</div>

<!-- About -->

<div class="about">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="section_title_container text-center">
                    <h2 class="section_title">Welcome To Unicat E-Learning</h2>
                    <div class="section_subtitle"><p>A place to share knowledge</p></div>
                </div>
            </div>
        </div>
        <div class="row about_row">

            <!-- About Item -->
            <div class="col-lg-4 about_col about_col_left">
                <div class="about_item">
                    <div class="about_item_image"><img src="images/about_1.jpg" alt=""></div>
                    <div class="about_item_title"><a href="#">Our Stories</a></div>
                    <div class="about_item_text">
                        <p>After the school experience of majoring in information technology, we felt that a website teaching that major was very necessary, so after the acquired knowledge we wanted to create a learning environment. practice for students to acquire more knowledge.</p>
                    </div>
                </div>
            </div>

            <!-- About Item -->
            <div class="col-lg-4 about_col about_col_middle">
                <div class="about_item">
                    <div class="about_item_image"><img src="images/about_2.jpg" alt=""></div>
                    <div class="about_item_title"><a href="#">Our Mission</a></div>
                    <div class="about_item_text">
                        <p>Educate people about information technology by watching videos and answering questions.</p>
                    </div>
                </div>
            </div>

            <!-- About Item -->
            <div class="col-lg-4 about_col about_col_right">
                <div class="about_item">
                    <div class="about_item_image"><img src="images/about_3.jpg" alt=""></div>
                    <div class="about_item_title"><a href="#">Our Vision</a></div>
                    <div class="about_item_text">
                        <p>We were also students, so we understand very well what students or learners need when looking for more knowledge online from which we come up with and create a really useful website.</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Feature -->

<div class="feature">
    <div class="feature_background" style="background-image:url(images/courses_background.jpg)"></div>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="section_title_container text-center">
                    <h2 class="section_title">Why Choose Us</h2>
                    <div class="section_subtitle"><p>Enthusiasm - Enthusiasm - Fresh updates - Dynamic environment</p></div>
                </div>
            </div>
        </div>
        <div class="row feature_row">

            <!-- Feature Content -->
            <div class="col-lg-6 feature_col">
                <div class="feature_content">
                    <!-- Accordions -->
                    <div class="accordions">

                        <div class="elements_accordions">

                            <div class="accordion_container">
                                <div class="accordion d-flex flex-row align-items-center"><div>Young and dynamic environment</div></div>
                                <div class="accordion_panel">
                                    <p>We are young people who always learn and collect the latest knowledge according to the times, from which we will share with everyone to develop together.</p>
                                </div>
                            </div>

                          

                            <div class="accordion_container">
                                <div class="accordion d-flex flex-row align-items-center"><div>Like-minded people</div></div>
                                <div class="accordion_panel">
                                    <p>Here we have experience and went through the same difficulties as everyone else. Therefore, we understand what you need in an online learning platform from which to help you get the necessary and important knowledge.</p>
                                </div>
                            </div>

                            <div class="accordion_container">
                                <div class="accordion d-flex flex-row align-items-center"><div>Our capacity</div></div>
                                <div class="accordion_panel">
                                    <p>We have gone through many projects large and small and one of the successes is the website you are using.</p>
                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- Accordions End -->
                </div>
            </div>

            <!-- Feature Video -->
            <div class="col-lg-6 feature_col">
                <div class="feature_video d-flex flex-column align-items-center justify-content-center">
                    <div class="feature_video_background" style="background-image:url(images/video.jpg)"></div>
                    <a class="vimeo feature_video_button" href="https://player.vimeo.com/video/99340873?title=0" title="OH, PORTUGAL - IN 4K - Basti Hansen - Stock Footage">
                        <img src="images/play.png" alt="">
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Team -->

<div class="team">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="section_title_container text-center">
                    <h2 class="section_title">Founders And Co-Founders</h2>
                    <div class="section_subtitle"><p>Introducing the talented team behind Unicat, the online learning website that is changing the game when it comes to education. Led by a group of experienced entrepreneurs and educators, this dynamic team is committed to making knowledge accessible to all through innovative technology and engaging course content.</p></div>
                </div>
            </div>
        </div>
        <div class="row team_row">

            <c:forEach items="${UserDAO.getAllAdminUser()}" var="x">
                <!-- Team Item -->
                <div class="col-lg-3 col-md team_col">
                    <div class="team_item">
                        <div class="team_image"><img src="${x.getImage()}" alt=""></div>
                        <div class="team_body">
                            <div class="team_title"><a href="#">${x.getFullName()}</a></div>
                            <div class="team_subtitle">Designer & Website</div>
                            <div class="social_list">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>

<!-- Counter -->

<div class="counter">
    <div class="counter_background" style="background-image:url(images/counter_background.jpg)"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="counter_content">
                    <h2 class="counter_title">Register Now</h2>
                    <div class="counter_text"><p>Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry?s standard dumy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p></div>

                    <!-- Milestones -->

                    <div class="milestones d-flex flex-md-row flex-column align-items-center justify-content-between">

                        <!-- Milestone -->
                        <div class="milestone">
                            <div class="milestone_counter" data-end-value="15">0</div>
                            <div class="milestone_text">years</div>
                        </div>

                        <!-- Milestone -->
                        <div class="milestone">
                            <div class="milestone_counter" data-end-value="120" data-sign-after="k">0</div>
                            <div class="milestone_text">years</div>
                        </div>

                        <!-- Milestone -->
                        <div class="milestone">
                            <div class="milestone_counter" data-end-value="670" data-sign-after="+">0</div>
                            <div class="milestone_text">years</div>
                        </div>

                        <!-- Milestone -->
                        <div class="milestone">
                            <div class="milestone_counter" data-end-value="320">0</div>
                            <div class="milestone_text">years</div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <div class="counter_form">
            <div class="row fill_height">
                <div class="col fill_height">
                    <form class="counter_form_content d-flex flex-column align-items-center justify-content-center" action="#">
                        <div class="counter_form_title">courses now</div>
                        <input type="text" class="counter_input" placeholder="Your Name:" required="required">
                        <input type="tel" class="counter_input" placeholder="Phone:" required="required">
                        <select name="counter_select" id="counter_select" class="counter_input counter_options">
                            <option>Choose Subject</option>
                            <option>Subject</option>
                            <option>Subject</option>
                            <option>Subject</option>
                        </select>
                        <textarea class="counter_input counter_text_input" placeholder="Message:" required="required"></textarea>
                        <button type="submit" class="counter_form_button">submit now</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Partners -->

<div class="partners">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="partners_slider_container">
                    <div class="owl-carousel owl-theme partners_slider">

                        <!-- Partner Item -->
                        <div class="owl-item partner_item"><img src="images/partner_1.png" alt=""></div>

                        <!-- Partner Item -->
                        <div class="owl-item partner_item"><img src="images/partner_2.png" alt=""></div>

                        <!-- Partner Item -->
                        <div class="owl-item partner_item"><img src="images/partner_3.png" alt=""></div>

                        <!-- Partner Item -->
                        <div class="owl-item partner_item"><img src="images/partner_4.png" alt=""></div>

                        <!-- Partner Item -->
                        <div class="owl-item partner_item"><img src="images/partner_5.png" alt=""></div>

                        <!-- Partner Item -->
                        <div class="owl-item partner_item"><img src="images/partner_6.png" alt=""></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="template/footer.jsp" %>