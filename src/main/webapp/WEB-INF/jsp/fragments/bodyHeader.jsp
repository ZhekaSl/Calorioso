<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="navbar navbar-expand-md navbar-dark bg-color-sections py-0">
    <div class="container">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand">
            <img src="resources/images/icon-meal.png" alt="logo">
            Calorioso
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <sec:authorize access="isAuthenticated()">
                <a class="btn btn-success ml-2" href="meals">
                    <spring:message code="user.meals"/>
                </a>
            </sec:authorize>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <sec:authorize access="isAuthenticated()">
                        <form:form class="form-inline my-2" action="logout" method="post">
                            <sec:authorize access="hasRole('ADMIN')">
                                <a class="btn btn-primary mr-1" href="users">
                                    <spring:message code="user.title"/>
                                </a>
                            </sec:authorize>
                            <a class="btn btn-primary mr-1" href="profile">
                                <sec:authentication property="principal.userTo.name"/>
                                <spring:message code="app.profile"/>
                            </a>
                            <button class="btn btn-danger my-1" type="submit">
                                <span class="fa fa-sign-out"></span>
                            </button>
                        </form:form>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                        <form:form class="form-inline my-2" id="login_form" action="spring_security_check" method="post">
                            <input class="form-control mr-1 bg-dark text-light border-gray" type="text" placeholder="Email" name="username" style="::placeholder {color: #ddd;}">
                            <input class="form-control mr-1 bg-dark text-light border-gray" type="password" placeholder="Password" name="password" style="::placeholder {color: #ddd;}">
                            <button class="btn btn-success" type="submit">
                                <span class="fa fa-sign-in"></span>
                            </button>
                        </form:form>
                    </sec:authorize>
                </li>
                <li class="nav-item dropdown">
                    <a class="dropdown-toggle nav-link my-1 ml-2" data-toggle="dropdown">${pageContext.response.locale}</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="${requestScope['javax.servlet.forward.request_uri']}?lang=en">English</a>
                        <a class="dropdown-item" href="${requestScope['javax.servlet.forward.request_uri']}?lang=ru">Русский</a>
                        <a class="dropdown-item" href="${requestScope['javax.servlet.forward.request_uri']}?lang=uk">Українська</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script type="text/javascript">
    var localeCode = "${pageContext.response.locale}";
</script>
