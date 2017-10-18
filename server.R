shinyServer(function(input, output) {
  output$contents1 <- renderTable({
    
    inFile1 <- input$file1
    
    if (is.null(inFile1))
      return(NULL)
    
    read.csv(inFile1$datapath, header=input$header, sep=input$sep)
  })
  
  output$contents2 <- renderTable({
    
    inFile2 <- input$file2
    
    if (is.null(inFile2))
      return(NULL)
    
    read.csv(inFile2$datapath, header=input$header, sep=input$sep)
  })
  
  output$contents3 <- renderTable({
    
    inFile3 <- input$file3
    
    if (is.null(inFile3))
      return(NULL)
    
    read.csv(inFile3$datapath, header=input$header, sep=input$sep)
  })
  
  output$contents4 <- renderTable({
    
    inFile4 <- input$file4
    
    if (is.null(inFile4))
      return(NULL)
    
    read.csv(inFile4$datapath, header=input$header, sep=input$sep)
  })
  
  output$contents5 <- renderTable({
    
    inFile5 <- input$file5
    
    if (is.null(inFile5))
      return(NULL)
    
    read.csv(inFile5$datapath, header=input$header, sep=input$sep)
  })
  
  
  output$contents <- renderTable({
    input$act
    
    indreq <- read.csv("C:\\Users\\sahan\\Desktop\\csv files\\indreq.csv")
    if(is.null(input$file1))     return(NULL)
    inFile1 <-input$file1
    if(is.null(input$file2))     return(NULL)
    inFile2 <- input$file2
    if(is.null(input$file3))     return(NULL)
    inFile3 <-input$file3
    if(is.null(input$file4))     return(NULL)
    inFile4 <- input$file4
    if(is.null(input$file5))     return(NULL)
    inFile5 <- input$file5
    
    filea <-read.csv(inFile1$datapath, header=input$header, sep=input$sep, quote=input$quote)
    fileb <-read.csv(inFile2$datapath, header=input$header, sep=input$sep, quote=input$quote)
    filec <-read.csv(inFile3$datapath, header=input$header, sep=input$sep, quote=input$quote)
    filed <-read.csv(inFile4$datapath, header=input$header, sep=input$sep, quote=input$quote)
    filee <-read.csv(inFile5$datapath, header=input$header, sep=input$sep, quote=input$quote)
    
    file1_match <- match(filea$Tokens, indreq$Tokens)
    Matched_f1 <- data.frame(filea$Subjects[!is.na(file1_match)])
    write.csv(Matched_f1, file = "Matched_BMSCE.txt")
    Unmatched_f1 <- data.frame(filea$Subjects[is.na(file1_match)])
    write.csv(Unmatched_f1, file = "Unmatched_BMSCE.txt")
    
    
    file2_match <- match(fileb$Tokens, indreq$Tokens)
    Matched_f2 <- data.frame(fileb$Subjects[!is.na(file2_match)])
    write.csv(Matched_f2, file = "Matched_MSRIT.txt")
    Unmatched_f2 <- data.frame(fileb$Subjects[is.na(file2_match)])
    write.csv(Unmatched_f2, file = "Unmatched_MSRIT.txt")
    
    file3_match <- match(filec$Tokens, indreq$Tokens)
    Matched_f3 <- data.frame(filec$Subjects[!is.na(file3_match)])
    write.csv(Matched_f3, file = "Matched_PESU.txt")
    Unmatched_f3 <- data.frame(filec$Subjects[is.na(file3_match)])
    write.csv(Unmatched_f3, file = "Unmatched_PESU.txt")
    
    file4_match <- match(filed$Tokens, indreq$Tokens)
    Matched_f4 <- data.frame(filed$Subjects[!is.na(file4_match)])
    write.csv(Matched_f4, file = "Matched_RV.txt")
    Unmatched_f4 <- data.frame(filed$Subjects[is.na(file4_match)])
    write.csv(Unmatched_f4, file = "Unmatched_RV.txt")
    
    score_f1 <- length(na.omit(file1_match))
    score_f2 <- length(na.omit(file2_match))
    score_f3 <- length(na.omit(file3_match))
    score_f4 <- length(na.omit(file4_match))
    
    scores <- c(score_f1, score_f2, score_f3, score_f4)
    
    barplot(scores ,main = "College score", xlim = c(0,5), ylim = c(0,20), ylab = "Scores", xlab = "Colleges", names.arg = c("BMSCE", "MSRIT", "PESU", "RV"), col = "blue")
    windows()
    
    eff_f1 <- (score_f1/length(file1_match))*100
    eff_f2 <- (score_f2/length(file2_match))*100
    eff_f3 <- (score_f3/length(file3_match))*100
    eff_f4 <- (score_f4/length(file4_match))*100
    
    eff <- c(eff_f1, eff_f2, eff_f3, eff_f4)
    
    barplot(eff , main = "Syllabus efficiency", xlim = c(0,5), ylim = c(0,100), ylab = "Efficiency", xlab = "Colleges", names.arg = c("BMSCE", "MSRIT", "PESU", "RV"), col = "red")
  })
})