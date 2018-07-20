package util.function;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/7/13.
 */
public class MainType {

    private String mainType;

    private List<String> subTypes=new ArrayList<>();

    public List<String> getSubTypes() {
        return subTypes;
    }

    public void setSubTypes(List<String> subTypes) {
        this.subTypes = subTypes;
    }

    public String getMainType() {
        return mainType;
    }

    public void setMainType(String mainType) {
        this.mainType = mainType;
    }

    public MainType(String mainType){

        this.mainType=mainType;

        if(mainType.equals("实践类")){
            subTypes.add("志愿者");
            subTypes.add("创新类");
            subTypes.add("学生会");
        }
        if(mainType.equals("学术类")){
            subTypes.add("数学类");
            subTypes.add("物理类");
            subTypes.add("化学类");
            subTypes.add("文学类");
            subTypes.add("计算机类");
        }
        if(mainType.equals("体育类")){
            subTypes.add("足球类");
            subTypes.add("篮球类");
            subTypes.add("排球类");
            subTypes.add("电竞类");
        }
        if(mainType.equals("艺术类")){
            subTypes.add("美术类");
            subTypes.add("影视类");
            subTypes.add("歌舞类");
        }
        if(mainType.equals("其他类")){
            subTypes.add("无");
        }
    }

}
