package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.MemberDto;
import com.project.petcarepedia.dto.ReviewDto;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.util.UUID;

@Service
public class FileUploadService {
    ////////////////////////////Review///////////////////////////////////////


    /*
     * multiFileDelete - �뵳�됰윮 占쎄텣占쎌젫占쎈뻻 占쎈솁占쎌뵬 占쎄텣占쎌젫
     */
    public void multiFileDelete(String[] oldFileName) throws Exception{
        //占쎈솁占쎌뵬占쎌벥 占쎄텣占쎌젫占쎌맄燁삼옙
        String root_path = System.getProperty("user.dir") + "\\src\\main\\resources\\statice\\upload\\";

        int count = 0;
        for(String list : oldFileName) {
            if(!list.equals("")) {
                File deleteFile = new File(root_path +  oldFileName[count]);
                System.out.println(root_path +  oldFileName[count]);
                if(deleteFile.exists()) {
                    deleteFile.delete();
                }
            }
            count++;
        }
    }

    /*
     * multiFileDelete - �뵳�됰윮 占쎈땾占쎌젟占쎈뻻 占쎄텣占쎌젫
     */
    public void multiFileDelete(ReviewDto reviewDto, String[] oldFileName) throws Exception{
        //占쎈솁占쎌뵬占쎌벥 占쎄텣占쎌젫占쎌맄燁삼옙
        String root_path = System.getProperty("user.dir") + "\\src\\main\\resources\\statice\\upload\\";

        int count = 0;
        for(CommonsMultipartFile file : reviewDto.getFiles()) {
            if(!file.getOriginalFilename().equals("")) { //占쎄퉱嚥≪뮇�뒲 占쎈솁占쎌뵬 占쎄퐨占쎄문
                File deleteFile = new File(root_path +  oldFileName[count]);
                System.out.println(root_path + oldFileName[count]);
                if(deleteFile.exists()) {
                    deleteFile.delete();
                }
            }
            count++;
        }
    }

    /*
     * multiFileSave - �뵳�됰윮 占쏙옙占쎌삢
     */
    public void multiFileSave(ReviewDto reviewDto) throws Exception {

        //占쎈솁占쎌뵬占쎌벥 占쏙옙占쎌삢占쎌맄燁삼옙
        String root_path = System.getProperty("user.dir") + "\\src\\main\\resources\\statice\\upload\\";
        int count = 0;
        for(CommonsMultipartFile file : reviewDto.getFiles()) {
            //占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈릭筌롳옙 占쎄퐣甕곌쑴肉� 占쏙옙占쎌삢
            if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
                File saveFile = new File(root_path +  reviewDto.getRsfiles().get(count));
                file.transferTo(saveFile);
            }
            count++;
        }
    }
    /*
     * multiFileCheck - 占쎈솁占쎌뵬 筌ｋ똾寃�
     */
    public ReviewDto multiFileCheck(ReviewDto reviewDto) {
        String[] nfile = {reviewDto.getRfile1(), reviewDto.getRfile2()};
        String[] nsfile = {reviewDto.getRsfile1(), reviewDto.getRsfile2()};
        int count = 0;
        for(CommonsMultipartFile file : reviewDto.getFiles()) {
            if(!file.getOriginalFilename().equals("")) {
                //占쎈솁占쎌뵬占쎌뵠 占쎌뿳占쎌벉
                UUID uuid = UUID.randomUUID();
                reviewDto.getRfiles().add(file.getOriginalFilename());
                reviewDto.getRsfiles().add(uuid+"_"+file.getOriginalFilename());
            }
            else {
                //占쎈솁占쎌뵬占쎌뵠 占쎈씨占쎌벉
                reviewDto.getRfiles().add(nfile[count]);
                reviewDto.getRsfiles().add(nsfile[count]);
            }
            count++;
        }
        reviewDto.setRfile1(reviewDto.getRfiles().get(0));
        reviewDto.setRsfile1(reviewDto.getRsfiles().get(0));
        reviewDto.setRfile2(reviewDto.getRfiles().get(1));
        reviewDto.setRsfile2(reviewDto.getRsfiles().get(1));


        return reviewDto;
    }


////////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////Hospital/////////////////////////////////////////////////////

    /**
     * fileDelete- 占쎈솁占쎌뵬 占쎄텣占쎌젫 疫꿸퀡�뮟
     */
    public void fileDelete(HttpServletRequest request, String oldFileName)
            throws Exception{

        String root_path = request.getSession().getServletContext().getRealPath("/");
        String attach_path = "\\resources\\upload\\";

        //占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈릭筌롳옙 占쎄퐣甕곌쑴肉� 占쏙옙占쎌삢
        if(oldFileName != null && !oldFileName.equals("")) {
            File deleteFile = new File(root_path + attach_path+ oldFileName);

            if(deleteFile.exists()) {
                deleteFile.delete();
            }
        }
    }

    /**
     * fileDelete-  占쎈땾占쎌젟占쎈막 占쎈르 疫꿸퀣�� 占쎈솁占쎌뵬 占쎄텣占쎌젫 疫꿸퀡�뮟
     */
    public void fileDelete2(HospitalVo hospitalVo, HttpServletRequest request, String oldFileName)
            throws Exception{

        String root_path = request.getSession().getServletContext().getRealPath("/");
        String attach_path = "\\resources\\upload\\";

        //占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈릭筌롳옙 占쎄퐣甕곌쑴肉� 占쏙옙占쎌삢
        if(!hospitalVo.getFile1().getOriginalFilename().equals("")) {
            File deleteFile = new File(root_path + attach_path+ oldFileName);
            //boardVo.getFile1().transferTo(deleteFile); //upload 占쎈쨨占쎈쐭    ->  JVM�⑨옙 占쎈솁占쎌뵬占쎌뵠 占쎈염野껉퀡由븝옙�뮉 揶쏆빘猿쒐몴占� 占쎄문占쎄쉐占쎈릭占쎈연 占쎈염野껉퀬鍮먧빳占쏙옙�뼄. 占쎈염野껉퀬鍮먧틠�눖�뮉 揶쏆빘猿� deleteFile
            System.out.println(root_path + attach_path+ oldFileName);
            if(deleteFile.exists()) {
                deleteFile.delete();
            }
        }
    }

    /**
     * fileSave 疫꿸퀡�뮟
     */
    public void fileSave(HospitalVo hospitalVo, HttpServletRequest request) throws Exception{

        String root_path = request.getSession().getServletContext().getRealPath("/");
        String attach_path = "\\resources\\upload\\";

        //占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈릭筌롳옙 占쎄퐣甕곌쑴肉� 占쏙옙占쎌삢
        if(hospitalVo.getHfile() != null && !hospitalVo.getHfile().equals("")) {
            //System.out.println("save file--->" + hospitalVo.getHfile());
            File saveFile = new File(root_path + attach_path+ hospitalVo.getHsfile());

            hospitalVo.getFile1().transferTo(saveFile);
        }
    }

    /**
     * fileCheck 疫꿸퀡�뮟
     */
    public HospitalVo fileCheck(HospitalVo hospitalVo) {
        if(hospitalVo.getFile1().getOriginalFilename() != null
                && !hospitalVo.getFile1().getOriginalFilename().contentEquals("")) {  //占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈릭筌롳옙

            //BSFILE 占쎈솁占쎌뵬 餓λ쵎�궗 筌ｌ꼶�봺
            UUID uuid = UUID.randomUUID();
            String hfile = hospitalVo.getFile1().getOriginalFilename();
            String hsfile = uuid + "_" + hfile;
            hospitalVo.setHfile(hfile);
            hospitalVo.setHsfile(hsfile);
        }else {
            System.out.println("占쎈솁占쎌뵬 占쎈씨占쎌벉");
//			hospitalVo.setHfile("");
//			hospitalVo.setHsfile("");
        }

        return hospitalVo;
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////Mypage/////////////////////////////////////////////////////////////////////////

    /*
     * file delete - 占쎈늄嚥≪뮉釉섓옙沅쀯쭪占� 占쎈땾占쎌젟占쎈막 占쎈르 疫꿸퀣�� 占쎄텢筌욑옙 占쎄텣占쎌젫疫꿸퀡�뮟
     */

    public void mfileDelete(String oldFileName) throws Exception{
        String root_path = System.getProperty("user.dir") + "\\src\\main\\resources\\statice\\upload\\";

            File deleteFile = new File(root_path + oldFileName);
            if(deleteFile.exists()) {
                deleteFile.delete();
            }
    }


    /*
     * fileSave疫꿸퀡�뮟 - 占쎌돳占쎌뜚占쎈늄嚥≪뮉釉섓옙沅쀯쭪占� 占쏙옙占쎌삢疫꿸퀡�뮟
     */

    public void mfileSave(MemberDto memberDto) throws Exception{

        String root_path = System.getProperty("user.dir") + "\\src\\main\\resources\\statice\\upload\\";
        if(memberDto.getMfile() != null && !memberDto.getMfile().equals("")) {
            //System.out.println("save file--->" + hospitalVo.getHfile());
            File saveFile = new File(root_path + memberDto.getMsfile());

            memberDto.getFile1().transferTo(saveFile);
        }
    }


    /*
     * fileCheck - 占쎌돳占쎌뜚 占쎈늄嚥≪뮉釉� 占쎄텢筌욑옙 筌ｋ똾寃�
     */

    public MemberDto mfileCheck(MemberDto memberDto) {
        if(memberDto.getFile1().getOriginalFilename() != null
                && !memberDto.getFile1().getOriginalFilename().contentEquals("")) {  //占쎈솁占쎌뵬占쎌뵠 鈺곕똻�삺占쎈릭筌롳옙

            //BSFILE 占쎈솁占쎌뵬 餓λ쵎�궗 筌ｌ꼶�봺
            UUID uuid = UUID.randomUUID();
            String mfile = memberDto.getFile1().getOriginalFilename();
            String msfile = uuid + "_" + mfile;
            memberDto.setMfile(mfile);
            memberDto.setMsfile(msfile);
        }else {
            System.out.println("�뙆�씪 �뾾�쓬");
        }

        return memberDto;
    }
}
