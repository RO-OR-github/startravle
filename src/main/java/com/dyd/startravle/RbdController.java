package com.dyd.startravle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class RbdController {
    @Autowired
    private RoadBoardDB rbd;
    @RequestMapping(value="", method = RequestMethod.GET)
    public String getBoard(Model model) {
        List<RoadBoard> roadBoard = rbd.select();
        model.addAttribute("main", roadBoard);
        return "index";
    }

}
