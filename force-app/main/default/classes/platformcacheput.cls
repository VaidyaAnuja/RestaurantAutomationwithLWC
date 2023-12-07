public class platformcacheput {
private Cache.OrgPartition part;
    public platformcacheput(){
        part = new Cache.OrgPartition('local.pc');
    }
    public void putschedule(String busline, Time[] schedule){
        if(part != null){
            part.put('busline', schedule);
        }
        //return;
    }
    
    public Time[] getschedule(String busline){
        Time[] schedule = (Time[])part.get(busline);
        if(schedule != null){
            return schedule;
        }else{
            return new List<Time>{Time.newInstance(8, 0, 0, 0), Time.newInstance(17, 0, 0, 0)};
        }
    }
}