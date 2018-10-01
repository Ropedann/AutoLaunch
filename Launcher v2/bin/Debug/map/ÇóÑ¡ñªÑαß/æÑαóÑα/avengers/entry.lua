--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�

    local EntryName = "Reactor Labyrinth"
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    Notice("Announcement: According to weather forecast, near Icicle City at ["..posx..","..posy.."] emerged a portal that leads to [Reactor Labyrinth].") --֪ͨ������������������

end

function after_destroy_entry_avengers(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: According to weather forecast, near Icicle City at ["..posx..","..posy.."] the portal to [Reactor Labyrinth] dissapeared! Remember to take note of the announcement!") 

end

function after_player_login_avengers(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    ChaNotice(player_name, "Announcement: According to weather forecast, near Icicle City at ["..posx..","..posy.."] emerged a portal that leads to [Reactor labyrinth].") --֪ͨ������������������

end

--���ڼ���������
--����ֵ��0�����������������1���ɹ����롣
function check_can_enter_avengers(role, copy_mgr)

	local Cha = TurnToCha(role)
  
	if Lv(Cha) >=65 and Lv(Cha) <=100 then
		
		return 1

	else
		SystemNotice(role, "To enter Forsaken City must be between Lv 65 to 100")
		return 0
	end
end


function begin_enter_avengers(role, copy_mgr) 

	SystemNotice(role,"Entering [Reactor Labyrinth]") 
	MoveCity(role, "Reactor Labyrinth")

end 