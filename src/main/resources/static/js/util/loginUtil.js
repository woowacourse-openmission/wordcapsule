import {apiUtil} from "./apiUtil.js";

export const getUserId = async () => {
    const loginId = document.body.dataset.loginId || "";
    try {
        const response = await apiUtil.get(`/users/id?loginId=${loginId}`);
        return response.id
    } catch (e) {
        console.error(e)
    }
}
