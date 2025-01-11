<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<jsp:include page="fragments/headTag.jsp"/>
<body class="bg-dark-main text-light">
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron jumbotron-fluid text-white py-4">
    <div class="container text-center">
        <h1 class="display-4">
            <spring:message code="app.title"/>
        </h1>

        <c:if test="${param.error}">
            <div class="alert alert-danger mt-3">
                <i class="fa fa-exclamation-triangle"></i>
                    ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
            </div>
        </c:if>

        <c:if test="${not empty param.message}">
            <div class="alert alert-success mt-3">
                <i class="fa fa-check-circle"></i>
                <spring:message code="${param.message}" text=""/>
            </div>
        </c:if>

        <sec:authorize access="isAnonymous()">
            <div class="pt-3">
                <a class="btn btn-lg btn-warning mt-3 px-5" href="profile/register">
                    <spring:message code="app.register"/> &raquo;
                </a>
                <button type="submit" class="btn btn-lg btn-info mt-3 px-5" onclick="login('user@yandex.ru', 'password')">
                    <spring:message code="app.login"/>
                    <spring:message code="app.user"/>
                </button>
                <button type="submit" class="btn btn-lg btn-info mt-3 px-5" onclick="login('admin@gmail.com', 'admin')">
                    <spring:message code="app.login"/>
                    <spring:message code="app.admin"/>
                </button>
            </div>
        </sec:authorize>
    </div>
</div>

<!-- New Content Blocks -->
<div class="container text-center bg-dark-main text-light py-4 rounded my-3">
    <h2 class="display-4">
        <spring:message code="app.features"/>
    </h2>
    <div class="row mt-4 d-flex align-items-stretch">
        <div class="col-md-4 mb-3">
            <div class="card bg-dark border-warning h-100">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">
                        <spring:message code="app.feature1.title"/>
                    </h5>
                    <p class="card-text">
                        <spring:message code="app.feature1.description"/>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card bg-dark border-info h-100">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">
                        <spring:message code="app.feature2.title"/>
                    </h5>
                    <p class="card-text">
                        <spring:message code="app.feature2.description"/>
                    </p>
                    <a href="swagger-ui.html" class="btn btn-warning mt-auto">
                        <i class="fa fa-cogs"></i>
                        <spring:message code="app.swaggerLink"/>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card bg-dark border-success h-100">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">
                        <spring:message code="app.feature3.title"/>
                    </h5>
                    <p class="card-text">
                        <spring:message code="app.feature3.description"/>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- User Reviews Section -->
<div class="container text-center bg-dark-main text-light py-4 rounded my-3">
    <h2 class="display-4 mb-4">
        <spring:message code="app.reviews"/>
    </h2>
    <div class="row">
        <div class="col-md-4 mb-3">
            <div class="card bg-dark text-light h-100">
                <div class="card-body">
                    <p class="card-text">"<spring:message code="app.review1"/> - Иван П.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card bg-dark text-light h-100">
                <div class="card-body">
                    <p class="card-text">"<spring:message code="app.review2"/> - Анна С.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card bg-dark text-light h-100">
                <div class="card-body">
                    <p class="card-text">"<spring:message code="app.review3"/> - Алексей К.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="fragments/footer.jsp"/>

<script type="text/javascript">
    <c:if test="${not empty param.username}">
    setCredentials("${param.username}", "");
    </c:if>

    function login(username, password) {
        setCredentials(username, password);
        $("#login_form").submit();
    }

    function setCredentials(username, password) {
        $('input[name="username"]').val(username);
        $('input[name="password"]').val(password);
    }
</script>
</body>
</html>
