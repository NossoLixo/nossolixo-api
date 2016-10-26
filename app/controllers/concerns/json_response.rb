module JsonResponse
  def success_response(response)
    {
      status: 'success',
      data: response
    }
  end

  def error_response(response_errors)
    {
      status: 'error',
      errors: response_errors
    }
  end
end
