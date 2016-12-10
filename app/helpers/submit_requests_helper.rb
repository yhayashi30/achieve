module SubmitRequestsHelper
    def change_status(status)
        case status
        when 1 then
            return '依頼中'
        when 2 then
            return '承認済'
        when 9 then
            return '依頼を却下'
        end    
    end
end
