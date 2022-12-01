package com.dyd.startravle;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BdController {
    @Autowired
    private BoardDB bd;

    @InitBinder
    public void initBinderForBoard(WebDataBinder webDataBinder) {
        webDataBinder.setDisallowedFields("writetime");
    }
    @RequestMapping(value="project/inputresult.do", method=RequestMethod.POST)
    public String bdinput(@ModelAttribute Board ret, Model model)
    {
        model.addAttribute("msg", ret);
        bd.create(ret);
        return "redirect:/project/board.do";
    }

    @RequestMapping(value="project/inputcontent.do", method=RequestMethod.GET)
    public String bdinput()
    {
//        model.addAttribute("input", new Board());
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

    @RequestMapping(value="project/bd_update.do", method=RequestMethod.GET)
    public String update(Model model,
                         @RequestParam(value="seq", required=true) int seq){
        Board board = bd.select(seq);
        model.addAttribute("msg", board);
        return "project/update";
    }


    @RequestMapping(value="project/bd_delete_exec.do", method=RequestMethod.POST)
    public String delete(@ModelAttribute Board board){
        board.setWritetime(new Date());
        bd.delete(board.getSeq());
        return "redirect:/project/board.do";
    }

    @RequestMapping(value="project/bd_update_exec.do", method=RequestMethod.POST)
    public String update(@ModelAttribute Board board) throws Exception{
        board.setWritetime(new Date());
        bd.update(board);
        return "redirect:/project/board.do";
    }

}

