<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body class="bg-dark-main text-light">
<script type="text/javascript" src="resources/js/topjava.common.js" defer></script>
<script type="text/javascript" src="resources/js/topjava.meals.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4 text-light">
    <div class="container">
        <h3 class="text-center common-text-color"><spring:message code="meal.title"/></h3>
        <%-- https://getbootstrap.com/docs/4.0/components/card/ --%>
        <div class="card border-gray bg-color-sections text-light">
            <div class="card-body pb-0">
                <form id="filter">
                    <div class="row">
                        <!-- "От" дата -->
                        <div class="col-6 col-md-3">
                            <label for="startDate" class="common-text-color"><spring:message code="meal.startDate"/></label>
                            <input class="form-control border-gray bg-dark-main text-white" name="startDate" id="startDate" autocomplete="off">
                        </div>

                        <!-- "До" дата -->
                        <div class="col-6 col-md-3">
                            <label for="endDate" class="common-text-color"><spring:message code="meal.endDate"/></label>
                            <input class="form-control border-gray bg-dark-main text-white" name="endDate" id="endDate" autocomplete="off">
                        </div>

                        <!-- "От" время -->
                        <div class="col-6 col-md-3">
                            <label for="startTime" class="common-text-color"><spring:message code="meal.startTime"/></label>
                            <input class="form-control border-gray bg-dark-main text-white" name="startTime" id="startTime" autocomplete="off">
                        </div>

                        <!-- "До" время -->
                        <div class="col-6 col-md-3">
                            <label for="endTime" class="common-text-color"><spring:message code="meal.endTime"/></label>
                            <input class="form-control border-gray bg-dark-main text-white" name="endTime" id="endTime" autocomplete="off">
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-footer text-right bg-color-sections border-dark">
                <!-- Кнопка очистки фильтра -->
                <button class="btn btn-outline-danger" onclick="clearFilter()">
                    <span class="fa fa-remove"></span>
                    <spring:message code="common.cancel"/>
                </button>
                <!-- Кнопка применения фильтра -->
                <button class="btn btn-outline-primary" onclick="ctx.updateTable()">
                    <span class="fa fa-filter"></span>
                    <spring:message code="meal.filter"/>
                </button>
            </div>
        </div>

        <br/>
        <button class="btn btn-primary" onclick="add()">
            <span class="fa fa-plus"></span>
            <spring:message code="common.add"/>
        </button>
        <table class="table table-striped table-dark" id="datatable">
            <thead>
            <tr>
                <th><spring:message code="meal.dateTime"/></th>
                <th><spring:message code="meal.description"/></th>
                <th><spring:message code="meal.calories"/></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
        </table>
    </div>
</div>

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
                        <label for="dateTime" class="col-form-label common-text-color"><spring:message code="meal.dateTime"/></label>
                        <input class="form-control bg-dark-main text-white border-gray" id="dateTime" name="dateTime" autocomplete="off"
                               placeholder="<spring:message code="meal.dateTime"/>">
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-form-label common-text-color"><spring:message
                                code="meal.description"/></label>
                        <input type="text" class="form-control bg-dark-main text-white border-gray" id="description" name="description"
                               placeholder="<spring:message code="meal.description"/>">
                    </div>

                    <div class="form-group">
                        <label for="calories" class="col-form-label common-text-color"><spring:message code="meal.calories"/></label>
                        <input type="number" class="form-control bg-dark-main text-white border-gray" id="calories" name="calories" placeholder="1000">
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
    <jsp:param name="page" value="meal"/>
</jsp:include>
</html>
