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
public class SchoolListBean {

    public class SchoolCell
    {
        private int id;
        private SchoolBean cell;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public SchoolBean getCell() {
            return cell;
        }

        public void setCell(SchoolBean cell) {
            this.cell = cell;
        }
        //todo: implement.
    }

    private int page;
    private int total;
    private int records;
    private List<SchoolCell> rows;




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

    public List<SchoolCell> getRows() {
        return rows;
    }

    public void setRows(List<SchoolCell> rows) {
        this.rows = rows;
    }

    public void paginate(int page, int rownum, List<SchoolBean> schools)
    {
        System.out.println("Paginate!");

        int base=(page-1)*rownum;

        System.out.println("====>base:"+base);
        rows=new ArrayList<SchoolCell>();
        if(base>=schools.size())
        {
            //todo:should report error?
            return;
        }
        for(int i=0;i<rownum;i++)
        {
            if((base+i)>=schools.size())break;
            SchoolCell cell=new SchoolCell();
            cell.setId(schools.get(base+i).getId());
            cell.setCell(schools.get(base+i));
            rows.add(cell);
        }
        return;

    }

}
