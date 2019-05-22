package cn.zq;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Unit test for simple App.
 */
public class AppTest 
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void shouldAnswerWithTrue()
    {
        String str="answer,Approval,approve,approveMX,bzzl,cards,cmp_gdtp,cmp_ggy,cxtj,dbsx,dbsxMX,doc_info,doc_mx,examPlan,gyzq,hljy,holiday,jxzbry,meetingRoom,modal,newClass,news,nw_gdtp,Options,program,question,resaa,resab,resac,resag,resak,resak1,resal,resam,resan,rescb,rescc,tc_gen_file,tsjy,U_f_re_cpoint_tt,UserModal,UserQX,users,vote,workerExam,WorkerVotes,WorkExamState,yuangao,查询";
        String[] strs=str.split(",");

        for (int i=0;i<strs.length;i++)
        {
            System.out.println("Sheets(\""+strs[i]+"\").Select\n" +
                    "Range(\"B1\").Activate\n"
            );
        }


    }
}
