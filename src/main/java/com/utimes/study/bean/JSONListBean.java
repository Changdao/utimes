package com.utimes.study.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-9
 * Time: 上午2:08
 * To change this template use File | Settings | File Templates.
 */
public class JSONListBean {

    public class Cell
    {
        private int id;
        private Object cell;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public Object getCell() {
            return cell;
        }

        public void setCell(Object cell) {
            this.cell = cell;
        }
        //todo: implement.
    }

    public interface IdGetter
    {
        public int getId(Object obj);
    }

    private int page;
    private int total;
    private int records;
    private List<Cell> rows;


    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getRecords() {
        return records;
    }

    public void setRecords(int records) {
        this.records = records;
    }

    public List<Cell> getRows() {
        return rows;
    }

    public void setRows(List<Cell> rows) {
        this.rows = rows;
    }

    public void addAllRows(List list,IdGetter idGetter)
    {
        rows=new ArrayList<Cell>();
        for(int i=0;i<list.size();i++)
        {
            Cell cell=new Cell();
            cell.setId(idGetter.getId(list.get(i)));
            cell.setCell(list.get(i));
            rows.add(cell);
        }
    }


    public void addPaginateRows(int page, int rownum, List list, IdGetter idGetter)
    {
        System.out.println("Paginate!");

        int base=(page-1)*rownum;

        System.out.println("====>base:"+base);
        rows=new ArrayList<Cell>();
        if(base>=list.size())
        {
            //todo:should report error?
            return;
        }
        for(int i=0;i<rownum;i++)
        {
            if((base+i)>=list.size())break;
            Cell cell=new Cell();
            cell.setId(idGetter.getId(list.get(base+i)));
            cell.setCell(list.get(base+i));
            rows.add(cell);
        }
    }

}
