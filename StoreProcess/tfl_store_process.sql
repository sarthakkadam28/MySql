DELIMITER $$
create procedure spcandidatetestresultdetails(IN pcandidateId INT, IN ptestId INT, OUT pcorrectAnswers INT, OUT pincorrectAnswers INT, OUT pskippedQuestions INT)
BEGIN
DECLARE totalQuestions INT;
DECLARE correctCandidateAnswers INT;
DECLARE attendedCount INT;

 SELECT COUNT(*) INTO attendedCount
    FROM candidateanswers
    INNER JOIN testquestions ON testquestions.questionbankid = candidateanswers.testquestionid
    WHERE candidateanswers.candidateid = pcandidateId 
      AND testquestions.testid = ptestId;

    IF attendedCount = 0 THEN
        SELECT 'Candidate has not attended the test.' AS message;
    ELSE
    
select count(*) INTO totalQuestions from testquestions where testid=ptestId;

SELECT COUNT(CASE WHEN candidateanswers.answerkey = questionbank.answerkey THEN 1 ELSE NULL END) AS score 
INTO correctCandidateAnswers FROM candidateanswers 
INNER JOIN   testquestions  on testquestions.questionbankid=candidateanswers.testquestionid
INNER JOIN   questionbank on questionbank.id=testquestions.questionbankid
WHERE candidateanswers.candidateid = pcandidateId AND testquestions.testid = ptestId;
SET pincorrectAnswers = totalQuestions-correctCandidateAnswers;

SELECT COUNT(*) INTO pskippedQuestions FROM CandidateAnswers INNER JOIN testQuestions ON testquestions.id = candidateanswers.testquestionid 
WHERE candidateanswers.answerkey="NO" AND candidateanswers.candidateId = pcandidateId AND testquestions.testId = ptestId;

SET pcorrectAnswers=correctCandidateAnswers;
END IF;
END $$

CALL spcandidatetestresultdetails(32,2, @pcorrectAnswers, @pincorrectAnswers,@pskippedQuestions);