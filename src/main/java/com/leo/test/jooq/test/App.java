package com.leo.test.jooq.test;

import com.leo.test.jooq.test.model.Tables;
import com.leo.test.jooq.test.model.tables.Course;
import com.leo.test.jooq.test.model.tables.Exam;
import com.leo.test.jooq.test.model.tables.Group;
import com.leo.test.jooq.test.model.tables.Student;
import org.jooq.DSLContext;
import org.jooq.Record4;
import org.jooq.Result;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Senchenko Viktor on 30.09.2016.
 */
public class App {
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

    private static final String DB_CONNECTION = "jdbc:mysql://titan/test?serverTimezone=UTC&characterEncoding=utf-8";

    private static final String DB_USER = "win";

    private static final String DB_PASSWORD = "ZbXUXsFYdVuysNG3";

    public static void main(String[] args) {
        System.out.println("You can learn more by link http://www.jooq.org/doc/3.8/manual-single-page/");
        new App().run();
    }

    private void run() {
        Connection conn = getConnection();
        DSLContext database = DSL.using(conn, SQLDialect.MYSQL);
        fillDatabase(database);
        printDatabase(database);
    }

    private void fillDatabase(DSLContext database) {
        //        database.delete(Tables.EXAM).execute();
        //        database.delete(Tables.COURSE).execute();
        //        database.delete(Tables.STUDENT).execute();
        //        database.delete(Tables.GROUP).execute();
        database.execute("SET FOREIGN_KEY_CHECKS = 0");
        database.truncate(Tables.EXAM).execute();
        database.truncate(Tables.COURSE).execute();
        database.truncate(Tables.STUDENT).execute();
        database.truncate(Tables.GROUP).execute();
        database.execute("SET FOREIGN_KEY_CHECKS = 1");

        database.insertInto(Tables.GROUP, Group.GROUP.NAME, Group.GROUP.YEAR).
                values("A-11", 1).
                values("A-21", 2).
                values("A-22", 2).
                execute();
        database.insertInto(Tables.STUDENT, Student.STUDENT.NAME, Student.STUDENT.SURNAME, Student.STUDENT.GROUP_ID).
                values("A", "A", 1).
                values("B", "A", 1).
                values("A", "B", 2).
                values("B", "B", 2).
                values("C", "B", 2).
                values("A", "C", 3).
                execute();
        database.insertInto(Tables.COURSE, Course.COURSE.NAME, Course.COURSE.GROUP_ID).
                values("A", 1).
                values("B", 1).
                values("C", 1).
                values("D", 2).
                values("E", 3).
                values("F", 3).
                execute();
        Timestamp timestamp = new Timestamp(new Date().getTime());
        database.insertInto(Tables.EXAM, Exam.EXAM.DATE, Exam.EXAM.COURSE_ID, Exam.EXAM.RESULT).
                values(timestamp, 1, new byte[]{}).
                values(timestamp, 2, new byte[]{}).
                values(timestamp, 2, new byte[]{}).
                values(timestamp, 3, new byte[]{}).
                values(timestamp, 4, new byte[]{}).
                values(timestamp, 5, new byte[]{}).
                values(timestamp, 5, new byte[]{}).
                values(timestamp, 6, new byte[]{}).
                values(timestamp, 6, new byte[]{}).
                execute();
    }

    private void printDatabase(DSLContext database) {
        System.out.println("########################################");
        Result<Record4<String, String, String, Integer>> result = database.select(Student.STUDENT.SURNAME, Student.STUDENT.NAME, Group.GROUP.NAME, Group.GROUP.YEAR).from(Tables.STUDENT).join(Tables.GROUP).on(Student.STUDENT.GROUP_ID.equal(Group.GROUP.ID)).orderBy(Student.STUDENT.SURNAME.asc(), Student.STUDENT.NAME.asc()).fetch();

        Result<Record4<String, Integer, String, Timestamp>> record4Result = database.select(Group.GROUP.NAME, Group.GROUP.YEAR, Course.COURSE.NAME, Exam.EXAM.DATE).from(Tables.EXAM).join(Tables.COURSE).on(Course.COURSE.ID.equal(Exam.EXAM.COURSE_ID)).join(Tables.GROUP).on(Course.COURSE.GROUP_ID.equal(Group.GROUP.ID)).orderBy(Group.GROUP.NAME.asc(), Group.GROUP.YEAR.asc(), Course.COURSE.NAME.asc()).fetch();

        System.out.println(result);
        for (Record4<String, String, String, Integer> record : result) {
            System.out.println("- " + String.format("Student %s %s learn in group %s at %s course)", record.getValue(0), record.getValue(1), record.getValue(2), record.getValue(Group.GROUP.YEAR)));
        }
        System.out.println("########################################\n");

        System.out.println(record4Result);
        for (Record4<String, Integer, String, Timestamp> record : record4Result) {
            System.out.println("- " + String.format("Group %s of course %s have exam by subgect %s in %td.%<tm.%<tY %<tH:%<tM:%4$tS)", record.getValue(0), record.getValue(1), record.getValue(2), record.getValue(Exam.EXAM.DATE)));
        }
        System.out.println("########################################\n");
    }

    private Connection getConnection() {
        try {
            Class.forName(DB_DRIVER);
            return DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
