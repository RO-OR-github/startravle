package com.dyd.startravle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BdController {
    @Autowired
    private BoardDB bd;

    @RequestMapping(value="project/inputresult.do", method=RequestMethod.POST)
    public String bdinput(@ModelAttribute Board ret, Model model)
    {
        model.addAttribute("msg", ret);
        bd.create(ret);
        return "project/watchcontent";
    }

    @RequestMapping(value="project/inputcontent.do", method=RequestMethod.GET)
    public String bdinput(Model model)
    {
        model.addAttribute("input", new Board());
        return "project/inputcontent";
    }

    //조회요청
    @RequestMapping(value="project/board.do", method = RequestMethod.GET)
    public String getBoard(Model model,
                             @RequestParam(value="seq", required=false, defaultValue="0")int seq) {
        if(seq==0) {
            List<Board> board = bd.select();
            model.addAttribute("bd_cmd", board);
            return "project/board";
        }else {
            Board board = bd.select(seq);
            model.addAttribute("msg",board);
            return "project/watchcontent";
        }
    }

    @RequestMapping(value="project/bd_update.do", method=RequestMethod.POST)
    public String update(Model model,
                         @RequestParam(value="seq", required=true) int seq){

        Board board = bd.select(seq);
        model.addAttribute("msg", board);
        return "project/update";
    }

    @RequestMapping(value="project/bd_delete_exec.do", method=RequestMethod.GET)
    public String delete(@RequestParam(value = "seq", required = true)int seq){
        bd.delete(seq);
        return "redirect:/board.do";
    }

    @RequestMapping(value="project/bd_update_exec.do", method=RequestMethod.POST)
    public String update(@ModelAttribute("msg") Board board){
        bd.update(board);
        return "redirect:/board.do";
    }

}

