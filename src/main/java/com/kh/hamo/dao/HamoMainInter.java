package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.HamoMainDTO;

public interface HamoMainInter {

	ArrayList<HamoMainDTO> totalClubSearch(HashMap<String, String> map);

}
