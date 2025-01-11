<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<jsp:include page="fragments/headTag.jsp"/>
<body class="bg-dark-main text-light">
<script src="resources/js/topjava.common.js" defer></script>
<script src="resources/js/topjava.users.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4 text-light">
    <div class="container">
        <h3 class="text-center common-text-color"><spring:message code="user.title"/></h3>
        <button class="btn btn-primary" onclick="add()">
            <span class="fa fa-plus"></span>
            <spring:message code="common.add"/>
        </button>
        <table class="table table-striped table-dark" id="datatable">
            <thead>
            <tr>
                <th><spring:message code="user.name"/></th>
                <th><spring:message code="user.email"/></th>
                <th><spring:message code="user.roles"/></th>
                <th><spring:message code="user.active"/></th>
                <th><spring:message code="user.registered"/></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <!-- Данные пользователей будут загружаться динамически с помощью JavaScript -->
            </tbody>
        </table>
    </div>
</div>

<!-- Модальное окно для редактирования пользователя -->
<div class="modal fade" tabindex="-1" id="editRow">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-dark-main text-light">
                <h4 class="modal-title" id="modalTitle"></h4>
                <button type="button" class="close text-light" data-dismiss="modal" onclick="closeNoty()">&times;</button>
            </div>
            <div class="modal-body bg-dark-main text-light">
                <form id="detailsForm">
                    <input type="hidden" id="id" name="id">

                    <div class="form-group">
                        <label for="name" class="col-form-label common-text-color"><spring:message code="user.name"/></label>
                        <input type="text" class="form-control bg-dark-main text-white border-gray" id="name" name="name" placeholder="<spring:message code="user.name"/>">
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-form-label common-text-color"><spring:message code="user.email"/></label>
                        <input type="email" class="form-control bg-dark-main text-white border-gray" id="email" name="email" placeholder="<spring:message code="user.email"/>">
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-form-label common-text-color"><spring:message code="user.password"/></label>
                        <input type="password" class="form-control bg-dark-main text-white border-gray" id="password" name="password" placeholder="<spring:message code="user.password"/>">
                    </div>
                </form>
            </div>
            <div class="modal-footer bg-dark-main border-gray">
                <button type="button" class="btn btn-secondary text-light" data-dismiss="modal" onclick="closeNoty()">
                    <span class="fa fa-close"></span>
                    <spring:message code="common.cancel"/>
                </button>
                <button type="button" class="btn btn-primary" onclick="save()">
                    <span class="fa fa-check"></span>
                    <spring:message code="common.save"/>
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="fragments/footer.jsp"/>
</body>
<jsp:include page="fragments/i18n.jsp">
    <jsp:param name="page" value="user"/>
</jsp:include>
</html>
