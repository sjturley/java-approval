FROM       cyberdojofoundation/java
LABEL maintainer=jon@jaggersoft.com

COPY junit-4.11.jar /approval/
COPY ApprovalTests.012.jar /approval/
ENV CLASSPATH=/approval/

COPY red_amber_green.rb /usr/local/bin