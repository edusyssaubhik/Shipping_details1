<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("/backoffice/login.asp")
   Else
%>
<!--#include file="../includes/connection.asp"-->
<%
'declaring the variables
Dim rqCourseId,rqEnrollId,rqstudentName,rqfback,rqfriend,rqwebSite,rqMagazines,rqothers
Dim rqcourseQua, rqfacultyQua,rqprice,rqmoneyBack,rqpassRate ,rqlocproximity,rqreimbursement,rqratingCourse
Dim rqratingTeaching,rqinstructor,rqoverallprgm,rqavgRating,rqenjoyedClass,rqsuggestion,rqrecommend,rqcorporateClass,rqcomment
Dim strQuery,rqinternet,rqother_Training,rqrecName,rqEmailId,rqphoneNo, rqLastName, rqFirstName
Dim rqFeedback_RecDate,rqaddedBy,rqaddedDate,rqmodifiedBy,rqmodifiedDate,rqType,rqID,Rs1,strQuery1,rqStudent_Name,rqRO_Comments 
Dim rqCP_Comments,rqcompanyName ,rqCompleted_Cert,rqPursue_Cert,rqimpFactors_Others ,rqFree_SixSigma

Function StrQuoteReplace(strValue)
StrQuoteReplace = Replace(strValue, "'", "''")
End Function 

'Creating Record Set
 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")


'Retrive The feed back Details From feedback-form.asp Page for perticulr Course id'

  rqID                = Request.Form("ID")  
 rqCourseId           =  Request.Form("CourseId")
 
 rqEnrollId           =   Request.Form("enrollId")
  rqFirstName          =   Request.Form("firstName")
  rqLastName          =   Request.Form("lastName")
 rqfback              =   Request.Form("fback")
 rqfriend             =   Request.Form("friend")
 rqwebSite            =   Request.Form("webSite")
 rqinternet           =   Request.Form("internet")
 rqMagazines          =   Request.Form("Magazines")
 rqothers             =   Request.Form("others")
 rqother_Training     =   Request.Form("other_training")
 rqcourseQua          =   Request.Form("courseQua")
 rqfacultyQua         =   Request.Form("facultyQua")
 rqprice              =   Request.Form("price")
 rqmoneyBack          =   Request.Form("moneyBack")
 rqpassRate           =   Request.Form("passRate")
 rqlocproximity       =   Request.Form("locproximity")
 rqreimbursement      =   Request.Form("reimbursement")
 rqratingCourse       =   Request.Form("ratingCourse")
 rqratingTeaching     =   Request.Form("ratingTeaching")
 rqinstructor         =   Request.Form("instructor")
 rqoverallprgm        =   Request.Form("overallprgm")
 rqavgRating          =   Request.Form("avgRating")
 rqenjoyedClass       =   Request.Form("enjoyedClass")
 rqsuggestion         =   Request.Form("suggestion")
 rqrecommend          =   Request.Form("recommend")
rqRO_Comments         =   Request.Form("RO_Comments")
 rqcorporateClass     =   Request.Form("corporateClass")
 rqcomment            =   Request.Form("comment")
  rqFeedback_RecDate   =   Request.Form("Feedback_RecDate") 
 rqaddedBy            =   Request.Form("addedBy")
 rqaddedDate          =   Request.Form("addedDate")
 rqmodifiedBy         =   Request.Form("modifiedBy")
 rqmodifiedDate       =   Request.Form("modifiedDate")
 rqStudent_Name       =   Request.Form("Student_Name")
 rqcompanyName        =   Request.Form("companyName")
 rqCP_Comments        = Request.Form("CP_Comments")
 rqCompleted_Cert     = Request.Form("Completed_Cert")
 rqPursue_Cert        = Request.Form("Pursue_Cert")
 rqFree_SixSigma      = Request.Form("Free_SixSigma")
 rqimpFactors_Others  = Request.Form("impFactors_Others")
 

 rqType = Request.Form("Submit")

 
If rqType = "Submit" Then
'query to insert the values into database'
 strQuery = "INSERT INTO PROJITIL_feedbacks (Course_ID, Enroll_ID, Student_Name, Feedback_Recieved, From_Friend, PMI_Website, From_Internet, From_Magzines, From_Others, Other_Training_Providers, Course_Quality,Faculty_Quality, Price, Moneyback_Guarantee, Pass_Rate, Location_Proximity, Company_Reimbursement, Rating_Course_Material, Rating_Teacher_Meth, Rating_Instructor, Rating_OverallProgram, Avg_Rating, About_Class, Improvement, Recommended_to_Others, RO_Comments, Coporate_Contact_Person, Comment,Feedback_RecDate, addedBy, addedDate,companyName,CP_Comments,Completed_Cert,Pursue_Cert,Free_SixSigma,impFactors_Others)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqCourseId & "',"
 strQuery = strQuery & "'" & rqEnrollId & "',"
 strQuery = strQuery & "'" & StrQuoteReplace(rqFirstName)& " "&StrQuoteReplace(rqlastName)&"',"
 strQuery = strQuery & "'" & rqfback & "',"
 strQuery = strQuery & "'" & rqfriend & "',"
 strQuery = strQuery & "'" & rqwebSite & "',"
  strQuery = strQuery & "'" & rqinternet & "',"
 strQuery = strQuery & "'" & rqMagazines & "',"
 strQuery = strQuery & "'" & rqothers & "',"
 strQuery = strQuery & "'" & rqother_Training  & "',"
  strQuery = strQuery & "'" & rqcourseQua & "',"
 strQuery = strQuery & "'" & rqfacultyQua & "',"
 strQuery = strQuery & "'" & rqprice & "',"
 strQuery = strQuery & "'" & rqmoneyBack & "',"
 strQuery = strQuery & "'" & rqpassRate & "',"
 strQuery = strQuery & "'" & rqlocproximity & "',"
 strQuery = strQuery & "'" & rqreimbursement & "',"
 strQuery = strQuery & "'" & rqratingCourse & "',"
 strQuery = strQuery & "'" & rqratingTeaching & "',"
 strQuery = strQuery & "'" & rqinstructor & "',"
 strQuery = strQuery & "'" & rqoverallprgm & "',"
 strQuery = strQuery & "'" & rqavgRating & "',"
 strQuery = strQuery & "'" & rqenjoyedClass & "',"
 strQuery = strQuery & "'" & rqsuggestion & "',"
 strQuery = strQuery & "'" & rqrecommend & "',"
 strQuery = strQuery & "'" & rqRO_Comments &"',"
 strQuery = strQuery & "'" & rqcorporateClass & "',"
  strQuery = strQuery & "'" & rqcomment& "',"
 strQuery = strQuery & "'"& rqFeedback_RecDate&"',"  
 strQuery = strQuery & "'"& Session("UserId")&"',"
 strQuery = strQuery & "'"& now()&"',"
 strQuery = strQuery & "'"& rqcompanyName&"',"
 strQuery = strQuery & "'"& rqCP_Comments&"',"
 strQuery = strQuery & "'"& rqCompleted_Cert&"'," 
 strQuery = strQuery & "'"& rqPursue_Cert&"'," 
 strQuery = strQuery & "'"& rqFree_SixSigma&"'," 
 strQuery = strQuery & "'"& rqimpFactors_Others&"')"  
'Response.write(strQuery)
 Rs.Open strQuery,ConnObj

 Session("message") = "You Have Successfully Inserted Values" 
 'Redirecting the page after inserting the values
Response.redirect("projITIL-feedback-form?courseId="&rqCourseId)
 End If
 
rqType1 = Request.Form("Update")
'Response.write(rqType)
'Query To update the values to database after Editing
 If rqType1 = "Update" Then
 strQuery1 = "UPDATE PROJITIL_feedbacks SET"
 strQuery1 = strQuery1 & " Student_Name = '"& StrQuoteReplace(rqStudent_Name) &"',"
 strQuery1 = strQuery1 & " Feedback_Recieved = '"& rqfback &"',"
 strQuery1 = strQuery1 & " From_Friend = '"& rqfriend &"',"
 strQuery1 = strQuery1 & " PMI_Website = '"& rqwebSite &"',"
  strQuery1 = strQuery1 & " From_Internet = '"& rqinternet &"',"
 strQuery1 = strQuery1 & " From_Magzines = '"& rqMagazines &"',"
 strQuery1 = strQuery1 & " From_Others = '"& rqothers &"',"
 strQuery1 = strQuery1 & " Other_Training_Providers = '"& rqother_Training &"',"
  strQuery1 = strQuery1 & " Course_Quality = '"& rqcourseQua &"',"
 strQuery1 = strQuery1 & " Faculty_Quality = '"& rqfacultyQua &"',"
 strQuery1 = strQuery1 & " Price = '"& rqprice &"',"
 strQuery1 = strQuery1 & " Moneyback_Guarantee = '"& rqmoneyBack  &"',"
 strQuery1 = strQuery1 & " Pass_Rate = '"& rqpassRate &"',"
 strQuery1 = strQuery1 & " Location_Proximity = '"&rqlocproximity &"',"
 strQuery1= strQuery1 & " Company_Reimbursement = '"& rqreimbursement &"',"
 strQuery1 = strQuery1 & " Rating_Course_Material = '"& rqratingCourse &"',"
 strQuery1 = strQuery1 & " Rating_Teacher_Meth = '"& rqratingTeaching &"',"
 strQuery1 = strQuery1 & " Rating_Instructor = '"& rqinstructor &"',"
 strQuery1 = strQuery1 & " Rating_OverallProgram = '"& rqoverallprgm &"',"
 strQuery1 = strQuery1 & " Avg_Rating = '"& rqavgRating &"',"
 strQuery1 = strQuery1 & " About_Class = '"& rqenjoyedClass &"',"
 strQuery1 = strQuery1 & " Improvement = '"& rqsuggestion&"',"
 strQuery1 = strQuery1 & " Recommended_to_Others = '"& rqrecommend &"',"
 strQuery1 = strQuery1 & " RO_Comments ='"& rqRO_Comments &"',"
 strQuery1 = strQuery1 & " Coporate_Contact_Person = '"& rqcorporateClass &"',"
  strQuery1 = strQuery1 & " Comment = '"& rqcomment&"',"
 strQuery1 = strQuery1 & " Feedback_RecDate = '"& rqFeedback_RecDate &"',"  
 strQuery1 = strQuery1 & " modifiedBy ='"& Session("UserId")&"',"
 strQuery1 = strQuery1 & " modifiedDate ='"& now()&"',"
 strQuery1 = strQuery1 & "companyName ='"& rqcompanyName &"',"
strQuery1 = strQuery1 & " CP_Comments = '"& rqCP_Comments &"',"
strQuery1 = strQuery1 & " Completed_Cert = '"& rqCompleted_Cert &"',"
strQuery1 = strQuery1 & " Pursue_Cert = '"& rqPursue_Cert &"',"
strQuery1 = strQuery1 & " Free_SixSigma = '"& rqFree_SixSigma &"',"
strQuery1 = strQuery1 & " impFactors_Others = '"& rqimpFactors_Others &"'"
strQuery1 = strQuery1 & " WHERE ID = '"& rqID &"'"
strQuery1 = strQuery1 & " and Course_ID = '"& rqCourseId &"'"
strQuery1 = strQuery1 & " and Enroll_ID = '"& rqEnrollId &"'"

  Rs1.Open strQuery1,ConnObj
 'Response.write(strQuery1)
 Session("message") = "You Have Successfully Edited"
 Response.Redirect("projITIL-feedback-form.asp?courseId="&rqCourseId)
 
 End If
 %>
 
 
 <%End If%>
 
 