package com.example.WD153.service;

import com.example.WD153.model.Exam;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ExamService {

    private final String DATA_FILE = "data/exams.txt";

    public ExamService() {
        try {
            File file = new File(DATA_FILE);
            if (!file.exists()) {
                if (file.getParentFile() != null) file.getParentFile().mkdirs();
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
