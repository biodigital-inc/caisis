/// <summary>
/// Summary description for IDiseaseState
/// </summary>
using System.Collections.Generic;
public interface IDiseaseState
{
    string GetAllCheckedDiseaseStates();

    void PopulateDiseaseStateLOI(List<string> disStates, bool bEdit);

    void PopulateDiseaseStateProjApproval(List<string> disStates, bool bEdit);
}
